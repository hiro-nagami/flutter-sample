import 'package:flutter/material.dart';
import 'package:todo/task-sample-with-provider/models/task.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard(this._task, {Key? key}) : super(key: key);

  final Task _task; // 修正
  
  @override
  Widget build(BuildContext context) {
    // 完了済みなら打ち消し線を引く
    var textStyle = _task.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;

    var title = Text(_task.title, style: textStyle); // 修正
    var content = Text(_task.content, style: textStyle); // 追加
    var checkIcon = _task.isDone ? const Icon(Icons.done) : null; // 追加

    return Card(
        child: ListTile(title: title, subtitle: content, trailing: checkIcon)); // 修正
  }

}