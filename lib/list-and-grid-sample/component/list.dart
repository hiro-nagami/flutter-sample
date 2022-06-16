import 'package:flutter/material.dart';
import 'package:todo/task-sample/models/task.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard(this._task, {Key? key}) : super(key: key);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    // 完了済みなら打ち消し線を引く
    var textStyle = _task.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;

    var title = Text(_task.title, style: textStyle);
    var content = Text(_task.content, style: textStyle);
    var checkIcon = _task.isDone ? const Icon(Icons.done) : null;

    return Card(
        child: ListTile(title: title, subtitle: content, trailing: checkIcon));
  }
}
