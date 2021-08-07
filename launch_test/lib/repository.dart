import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo.dart';

class TodoRepository {
  Future<List<Todo>> loadAllTodo() async {
    final pref = await SharedPreferences.getInstance();
    final raw = pref.getString("todos");
    if (raw != null) {
      final decoded = json.decode(raw) as List;
      print("------------");
      print(json.decode(raw));
      print(json.decode(raw) as List);

      return decoded
          .cast<Map<String, dynamic>>()
          .map(
            (e) =>
            Todo(
              title: e["title"],
              done: e["done"],
            ),
      )
          .toList();
    }
    return [];
  }

  Future<void> saveAllTodo(List<Todo> todos) async {
    final pref = await SharedPreferences.getInstance();
    final values = todos.map((e) =>
    {
      "title": e.title,
      "done": e.done,
    }).toList();
    final raw = json.encode(values);
    await pref.setString("todos", raw);
  }
}