import 'package:flutter/material.dart';
import 'package:todo/task-sample/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList(this.tasks, {Key? key}) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    var cards = tasks.map(createListItem).toList();
    return ListView(children: cards);
  }

  Widget createListItem(Task task) {
    bool _isDone = task.isDone;
    String done = _isDone ? "DONE" : "";

    return Card(
        child: ListTile(
            title: Text(task.title),
            subtitle: Text(task.content),
            trailing: Text(done)));
  }
}
