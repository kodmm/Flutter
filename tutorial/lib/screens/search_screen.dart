import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tutorial/screens/profile_screen.dart';
import 'package:tutorial/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Search for a user'
          ),
          onFieldSubmitted: (String _) {
            setState((){
              isShowUsers = true;
            });
          }
        ),
      ),
      body: isShowUsers? FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .where(
              'username',
              isGreaterThanOrEqualTo: searchController.text,
            )
            .get(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen(uid: (snapshot.data! as dynamic).docs[index]['uid'],),)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        (snapshot.data! as dynamic).docs[index]['photoUrl']
                    ),
                  ),
                  title: Text(
                      (snapshot.data! as dynamic).docs[index]['username']
                  ),
                ),
              );
            },
          );
        }
      ): FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('posts').get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return StaggeredGrid.count(
              crossAxisCount: 4,
              children: snapshot.data!.docs.map((dynamic doc) => StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Image.network(doc.data()['postUrl']))).toList()
            );
          }
      ),
    );
  }
}
