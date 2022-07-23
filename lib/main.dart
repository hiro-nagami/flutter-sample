import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/inherited-widget-sample/index.dart';
import 'package:todo/list-and-grid-sample/index.dart';
import 'package:todo/provider-and-notifier-sample/index.dart';
import 'package:todo/task-sample-only-state/index.dart';
import 'package:todo/task-sample-with-provider/index.dart';

void main() {
  runApp(const MyApp());
}

final List<_ListItem> _items = [
  _ListItem(
    title: "List UI",
    description: "ListView / GridView / Table are tested.",
    path: "/list-sample",
    page: (BuildContext context) => const ListSample()),
  _ListItem(
    title: "Counter (InheritedWidget)",
    description: "This is sample for inherited widget.",
    path: "/count-page",
    page: (BuildContext context) => const CountPage()),
  _ListItem(
    title: "Counter (Provider)",
    description: "This is sample for provider.",
    path: "/count-page-with-provider",
    page: (BuildContext context) => const CountPageWithProvider()),
  _ListItem(
    title: "Todo List UI (Only state)",
    description: "Todo list ui sample",
    path: "/task-sample",
    page: (BuildContext context) => const TaskSample()),
  _ListItem(
    title: "Todo List UI (Provider)",
    description: "Todo list ui sample",
    path: "/task-sample-with-provider",
    page: (BuildContext context) {
      return ChangeNotifierProvider<TaskData>.value(
        value: TaskData(),
        child: const TodoListWithProviderSample(),
      );
    }
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {};
    _items.forEach((item) { routes[item.path] = item.page; });
    return MaterialApp(
        title: 'Flutter Samples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BasePage(),
        routes: routes
    );
  }
}

class _ListItem {
  final String title;
  final String description;
  final WidgetBuilder page;
  final String path;

  _ListItem(
      {required this.title, required this.description, required this.page, required this.path});
}

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = _items.map((item) {
      return InkWell(
          onTap: () => Navigator.of(context).pushNamed(item.path),
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
          )
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: navigation),
    );
  }
}
