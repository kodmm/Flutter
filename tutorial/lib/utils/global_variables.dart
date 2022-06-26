import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/screens/add_post_screen.dart';
import 'package:tutorial/screens/feed_screen.dart';
import 'package:tutorial/screens/profile_screen.dart';
import 'package:tutorial/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems =[
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,),
  Center(child: Text('center')),
];