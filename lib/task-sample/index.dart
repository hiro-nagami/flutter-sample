import 'package:flutter/material.dart';
import 'package:todo/task-sample/component/list.dart';
import 'package:todo/task-sample/models/task.dart';
import 'package:todo/task-sample/pages/createTaskView/index.dart';

class TaskSample extends StatefulWidget {
  const TaskSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskSample> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("タスクリスト"),
      ),
      body: TaskList(tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CreateTaskView();
          }));

          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
