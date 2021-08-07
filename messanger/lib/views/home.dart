import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messanger/helperfunctions/sharedpref_helper.dart';
import 'package:messanger/services/auth.dart';
import 'package:messanger/services/database.dart';

import 'chatscreen.dart';
import 'signin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? myName, myProfilePic, myUserName, myEmail;
  bool isSearching = false;
  Stream? usersStream, chatRoomsStream;

  TextEditingController searchUsernameEditingController =
      TextEditingController();

  getMyInfoFromSharedPreference() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();

  }

  String getChataRoomIdByUsernames(String a, b) {
    if (a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
      return "$b\_$a";
    }else {
      return "$a\_$b";
    }
  }

  onSearchBtnClick() async {
    setState((){
      isSearching = true;

    });
    usersStream = await DatabaseMethods().getUserByUserName
      (searchUsernameEditingController.text);
  }


  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return ChatRoomListTile(ds["lastMessage"], ds.id, myUserName.toString());
          }
        ) : Center(child: CircularProgressIndicator());
      }
    );
  }


  Widget searchListUserTile({String profileUrl = "", name, username, email}){
    return GestureDetector(
      onTap: (){
        var chatRoomId = getChataRoomIdByUsernames(myUserName.toString(), username);

        Map<String, List> chatRoomInfoMap = {
          "users": [myUserName, username]
        };

        DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);

        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ChatScreen(username, name)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              profileUrl,
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(email),
            ],
          )
        ],
      ),
    );
  }

  Widget searchUsersList() {
    return StreamBuilder(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData? ListView.builder(
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return searchListUserTile(
              profileUrl: ds["imgUrl"],
              name: ds["name"],
              email: ds["email"],
              username: ds["username"]
            );
          },
        ) : Center(
          child: Text("bububun"),
        );
      }
    );
  }

  getChatRooms() async {
    chatRoomsStream = await DatabaseMethods().getChatRooms();
    print(chatRoomsStream);
    setState((){});
  }

  onScreenLoaded() async {
    await getMyInfoFromSharedPreference();
    getChatRooms();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messanger Clone1"),
        actions: [
          InkWell(
            onTap: (){
              AuthMethods().signOut().then((value){
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn
                  ()));
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
               isSearching
                ? GestureDetector(
                    onTap: (){
                      isSearching = false;
                      searchUsernameEditingController.text = "";
                      setState((){

                      });
                    },
                    child: Padding(
                     padding: EdgeInsets.only(right: 12),
                     child: Icon(Icons.arrow_back),),
                  )
                : Container(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchUsernameEditingController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "username"
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (searchUsernameEditingController.text != "") {
                              onSearchBtnClick();
                            }
                          },
                          child: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isSearching? searchUsersList() : chatRoomsList()
          ],
        ),
      ),
    );
  }
}

class ChatRoomListTile extends StatefulWidget {
  String myUsername, lastMessage, chatRoomId;
  ChatRoomListTile(this.myUsername, this.chatRoomId, this.lastMessage);

  _ChatRoomListTileState createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends State<ChatRoomListTile> {
  String? profilePicUrl, name, username;

  getThisUserInfo() async {
    username = widget.chatRoomId.replaceAll(widget.myUsername, "").replaceAll("_", "");
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserInfo(username.toString());
    print("something ${querySnapshot.docs[0]}");
    name = querySnapshot.docs[0]["name"];
    profilePicUrl = querySnapshot.docs[0]["imgUrl"];
    setState((){});
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[

        Column(
          children: [
                Text(name.toString()),
                Text(widget.lastMessage)
              ],
        ),
      ],
    );
  }
}