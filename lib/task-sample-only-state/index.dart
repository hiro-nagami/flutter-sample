import 'package:flutter/material.dart';
import 'package:todo/task-sample-only-state/models/task.dart';
import 'package:todo/task-sample-only-state/component/task_list_card.dart';
import 'package:todo/task-sample-only-state/pages/createTaskView/index.dart';

class TaskSampleOnlyState extends StatefulWidget {
  const TaskSampleOnlyState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TaskSampleOnlyState> {
  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    var listItems = _tasks
        .map((task) => InkWell(
            onTap: (() => changeState(task.id)), child: TaskListCard(task)))
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
    setState(() => _tasks.add(newTask));
  }

  // 同一IDのタスクを見つけてステータス変更
  changeState(int id) {
    for (var task in _tasks) {
      if (task.id == id) task.changeState();
    }

    setState(() => { _tasks });
  }

  // 新規作成画面への遷移
  showAddingTaskPage() {
    Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CreateTaskView()))
      .then((newTask) {
        if (newTask != null) {
          addNewTask(newTask);
        }
      });
  }
}
