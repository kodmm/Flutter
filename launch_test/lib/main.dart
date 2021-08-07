import 'package:flutter/material.dart';

import 'repository.dart';
import 'todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(TodoRepository()),
    );
  }
}