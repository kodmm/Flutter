import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tvchat/helperfunctions/sharedpref_helper.dart';
import 'package:tvchat/screens/chats/chats_screen.dart';

import '../main.dart';
import 'database.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }


  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;


      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
      );

      UserCredential result = await _firebaseAuth.signInWithCredential(credential);

      User? userDetails = result.user;

      SharedPreferenceHelper().saveUserEmail(userDetails!.email.toString());
      SharedPreferenceHelper().saveUserId(userDetails.uid);
      SharedPreferenceHelper().saveUserName(userDetails.email!.replaceAll("@gmail.com", ""));
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName!);
      SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL!);

      Map<String, String> userInfoMap = {
        "email": userDetails.email!,
        "username": userDetails.email!.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName!,
        "imgUrl": userDetails.photoURL!,
      };

      DatabaseMethods()
        .addUserInfoToDB(userDetails.uid, userInfoMap)
        .then((value) {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatsScreen())
          );
        });
    }

  }

  signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await auth.signOut()
        .then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage())
      );
    });
  }

}