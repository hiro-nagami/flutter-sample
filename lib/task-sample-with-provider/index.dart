import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task-sample-with-provider/models/task.dart';
import 'package:todo/task-sample-with-provider/component/task_list_card.dart';
import 'package:todo/task-sample-with-provider/pages/create_task_view.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // 同一IDのタスクを見つけてステータス変更
  void doneTask(Task task) {
    if (task.isDone) return;

    Task oldTask = _tasks.firstWhere((t) => t.id == task.id);
    Task newTask = Task(
      oldTask.id,
      oldTask.title,
      oldTask.content,
      true,
    );
    _tasks.removeWhere((t) => t.id == task.id);
    _tasks.add(newTask);
    notifyListeners();
  }

  // 新規作成したタスクを一覧へ追加
  addTask(String title, String content) {
    Task newTask = Task(_tasks.length + 1, title, content, false);
    newTask.id = _tasks.length + 1;
    _tasks.add(newTask);
    notifyListeners();
  }
}

class TaskSampleWithProvider extends StatelessWidget {
  const TaskSampleWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const TodoList();
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskData = context.watch<TaskData>();

    var listItems = taskData.tasks
        .map((task) => InkWell(
            onTap: (() => taskData.doneTask(task)), child: TaskListCard(task)))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("タスクリスト"),
      ),
      body: ListView(children: listItems),
      floatingActionButton: FloatingActionButton(
        // 新規作成画面への遷移
        onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CreateTaskView())),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
