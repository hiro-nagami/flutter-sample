import 'package:flutter/material.dart';
import 'package:todo/task-sample-only-state/models/task.dart';

class CreateTaskView extends StatelessWidget {
  // アンダースコアがあるものはprivate変数
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("タスク作成"),
        ),
        body: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "タイトル"),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "詳細"),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
                child: const Text("作成"),
                onPressed: () {
                  var title = _titleController.text;
                  var content = _contentController.text;

                  var task = Task(0, title, content, false);
                  Navigator.of(context).pop(task);
                }))
          ],
        ));
  }
}
