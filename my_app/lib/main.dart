import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() {
  debugPaintSizeEnabled = true;
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      // ListViewを使用しリスト一覧を表示
      body: ListView(
        children: <Widget>[
          // CardとListTitleを使用し簡単に整ったUIを作成
          Card(
            child: ListTile(
              title: Text('YOASOBI'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('SMAP'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('ARASHI'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('V6')
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面(クリックで戻る)'),
        ),
      ),
    );
  }
}
