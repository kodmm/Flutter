import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  // Firebase初期化

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAuthPage(),
    );
  }
}

class MyAuthPage extends StatefulWidget {
  @override
  _MyAuthPageState createState() => _MyAuthPageState();
}

class _MyAuthPageState extends State<MyAuthPage> {

  // 登録
  String newUserEmail = '';
  String newUserPassword = '';

  // ログイン
  String loginUserEmail = '';
  String loginUserPassword = '';

  // 登録・ログインに関する情報を表示
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState((){
                    newUserEmail = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "パスワード(6文字以上)"),
                // パスワードが見えないようにする
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    newUserPassword = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      // mail / password でユーザ登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final UserCredential result =

                      await auth.createUserWithEmailAndPassword(
                          email: newUserEmail,
                          password: newUserPassword
                      );


                      // 登録したUser info
                      final User user = result.user;
                      setState(() {
                        infoText = "登録OK:${user.email}";
                      });
                    } catch(e) {
                      setState(() {
                        infoText = "登録NG:${e.toString()}";
                      });
                    }
                  },
                  child: Text("ユーザ登録")
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState((){
                    loginUserEmail = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "パスワード"),
                obscureText: true,
                onChanged: (String value) {
                  setState((){
                    loginUserPassword = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                        await auth.signInWithEmailAndPassword(
                          email: loginUserEmail,
                          password: loginUserPassword,
                        );
                    final User user = result.user;
                    setState(() {
                      infoText = "ログインOK: ${user.email}";
                    });
                  } catch(e) {
                    setState((){
                      infoText = "ログインNG:${e.toString()}";
                    });
                  }
                },
                child: Text("ログイン"),
              ),
              const SizedBox(height: 8),
              Text(infoText),
            ],
          ),

        ),
      ),
    );
  }
}

