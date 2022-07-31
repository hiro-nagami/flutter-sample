import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task-sample-with-provider/index.dart';

class CreateTaskView extends StatelessWidget {
  // アンダースコアがあるものはprivate変数
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  CreateTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskData = context.watch<TaskData>();

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
                  taskData.addTask(_titleController.text, _contentController.text);
                  Navigator.pop(context);
                }
                ))
          ],
        ));
  }
}
