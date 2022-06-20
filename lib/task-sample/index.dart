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
  List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    // タップした時にタスクを終了にする
    var listItems = _tasks
        .map((task) => InkWell(
            onTap: (() => chagneState(task.id)), child: TaskListCard(task)))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("タスクリスト"),
      ),
      body: ListView(children: listItems),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddingTaskPage,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  // 新規作成したタスクを一覧へ追加
  addNewTask(Task newTask) {
    newTask.id = _tasks.length + 1;
    setState(() {
      _tasks.add(newTask);
    });
  }

  // 新規作成画面への遷移
  showAddingTaskPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateTaskView()))
        .then((newTask) => {if (newTask != null) addNewTask(newTask)});
  }

  // 同一IDのタスクを見つけてステータス変更
  chagneState(int id) {
    for (var task in _tasks) {
      if (task.id == id) task.changeState();
    }

    setState(() => _tasks = _tasks);
  }
}
