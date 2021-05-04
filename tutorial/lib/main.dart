import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyFirestorePage(),
    );
  }
}

class MyFirestorePage extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<MyFirestorePage> {
  List<DocumentSnapshot> documentList = [];

  String orderDocumentInfo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('コレクション+ドキュメント作成'),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_ghi')
                    .set({'name': '鈴木', 'age': 40});
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              child: Text('サブコレクション+ ドキュメント作成'),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_ghi')
                    .collection('orders')
                    .doc('id_789')
                    .set({'price': 600, 'date': '9/13'});
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              child: Text('ドキュメント一覧取得'),
              onPressed: () async {
                final snapshot =
                    await FirebaseFirestore.instance.collection('users').get();
                print(snapshot.docs);
                setState(() {
                  documentList = snapshot.docs;
                });
              },
            ),
            Column(
              children: documentList.map((document) {
                return ListTile(
                  title: Text('${document['name']}さん'),
                  subtitle: Text('${document['age']}歳'),
                );
              }).toList(),
            ),
            ElevatedButton(
              child: Text('ドキュメントを指定して取得'),
              onPressed: () async {
                final document = await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_123')
                    .get();

                setState((){
                  orderDocumentInfo =
                      '${document['date']} ${document['price']}円';
                });
              },
            ),
            ListTile(title: Text(orderDocumentInfo)),
          ],
        ),
      ),
    );
  }
}