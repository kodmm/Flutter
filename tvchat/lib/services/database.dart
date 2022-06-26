import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tvchat/helperfunctions/sharedpref_helper.dart';

class DatabaseMethods {
  final String broadcastingOffices = "broadcastingOffices";
  final String users = "users";
  final String chats = "chats";

  Future addUserInfoToDB(
      String userId, Map<String, String> userInfoMap
      ) async {
    return FirebaseFirestore.instance
        .collection(users)
        .doc(userId)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getBroadcastingOffices() async {
    return FirebaseFirestore.instance
        .collection(broadcastingOffices)
        .get();
  }

  Future<Stream<QuerySnapshot>> getChats(String broadcastingOffice) async {
    return FirebaseFirestore.instance
        .collection(broadcastingOffices)
        .doc(broadcastingOffice)
        .collection(chats)
        .orderBy("ts")
        .snapshots();
  }

  Future<void> joinChats(String broadcastingOffice) async {
    String myUsername = await SharedPreferenceHelper().getUserName() as String;
    FirebaseFirestore.instance
        .collection(broadcastingOffices)
        .doc(broadcastingOffice)
        .get()
        .then((documentSnapshot){
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

          if (!data['users'].contains(myUsername)) {
            FirebaseFirestore.instance
                .collection(broadcastingOffices)
                .doc(broadcastingOffice)
                .update({
              "users": FieldValue.arrayUnion([myUsername])
            });
          }
        });
  }

  Future addMessage(String broadcastingOffice, messageId, Map<String, dynamic> messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection(broadcastingOffices)
        .doc(broadcastingOffice)
        .collection(chats)
        .doc(messageId)
        .set(messageInfoMap);
  }

  updateLastMessageSend(String broadcastingOffice, Map<String, dynamic> broadCastingOfficeMap) {
    FirebaseFirestore.instance
        .collection(broadcastingOffices)
        .doc(broadcastingOffice)
        .update(broadCastingOfficeMap);
  }
}