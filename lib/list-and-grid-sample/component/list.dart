import 'package:flutter/material.dart';
import 'package:todo/list-and-grid-sample/models/item.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard(this._item, {Key? key}) : super(key: key);

  final Item _item;

  @override
  Widget build(BuildContext context) {
    // 完了済みなら打ち消し線を引く
    var textStyle = _item.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;

    var title = Text(_item.title, style: textStyle);
    var content = Text(_item.content, style: textStyle);
    var checkIcon = _item.isDone ? const Icon(Icons.done) : null;

    return Card(
        child: ListTile(title: title, subtitle: content, trailing: checkIcon));
  }
}
