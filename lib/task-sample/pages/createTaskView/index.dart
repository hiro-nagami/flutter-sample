import 'package:flutter/material.dart';
import 'package:todo/task-sample/models/task.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CreateTaskState();
}

class CreateTaskState extends State<CreateTaskView> {
  final List<Task> tasks = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
              border: OutlineInputBorder(),
              labelText: "タイトル"
            ), 
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "詳細"
            ), 
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
              child: const Text("作成"),
              onPressed: addTask
            )
          )
        ],
      )
    );
  }

  void addTask() {
      String title = _titleController.text;
      String  content = _contentController.text;
      bool isDone = false;
      var task = Task(title, content, isDone);
      Navigator.of(context).pop(task);
  }
}
