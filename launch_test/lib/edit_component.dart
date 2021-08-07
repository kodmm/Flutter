import 'package:flutter/material.dart';

import 'todo.dart';

class EditDialog extends StatefulWidget {
  static Future<Todo?> show(BuildContext context, [Todo? base]) {
    return showDialog(
        context: context,
        builder: (context) => EditDialog(base: base),
        barrierDismissible: true,
    );
  }

  EditDialog({
    this.base
  }):super();

  final Todo? base;

  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.base?.title);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(hintText: "TODO"),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            Navigator.pop(
              context,
              Todo(title: _textEditingController.text),
            );
          },
          child: Text("保存"),
        )
      ]
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}