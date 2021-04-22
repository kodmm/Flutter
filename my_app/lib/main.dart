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
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // テキストを入力
            TextField(),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: (){},
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),

              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
