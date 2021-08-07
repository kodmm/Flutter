import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messanger/helperfunctions/sharedpref_helper.dart';
import 'package:messanger/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


    final GoogleSignInAccount? googleSignInAccount =
    await GoogleSignIn(
    ).signIn();

    print(googleSignInAccount);

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await
      googleSignInAccount.authentication;

      print("------------");
      print(googleSignInAuthentication);

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );

      UserCredential result = await _firebaseAuth.signInWithCredential
        (credential);

      dynamic userDetails = result.user;

      print(userDetails.runtimeType.toString());

      SharedPreferenceHelper().saveUserEmail(userDetails.email);
      SharedPreferenceHelper().saveUserId(userDetails.uid);
      SharedPreferenceHelper().saveUserName(userDetails.email.replaceAll("@gmail.com", ""));
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName);
      SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL);

      Map<String, String> userInfoMap = {
        "email": userDetails.email,
        "username": userDetails.email.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL,
      };

      DatabaseMethods()
          .addUserInfoToDB(userDetails.uid, userInfoMap)
          .then((value){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())
        );
      });


    }
  }
  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await auth.signOut();
  }
}