import 'package:flutter/material.dart';
import 'package:todo/inherited-widget-sample/index.dart';
import 'package:todo/list-and-grid-sample/index.dart';
import 'package:todo/task-sample/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Samples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BasePage());
  }
}

class _ListItem {
  final String title;
  final String description;
  final Widget page;

  _ListItem(
      {required this.title, required this.description, required this.page});
}

class BasePage extends StatelessWidget {
  BasePage({Key? key}) : super(key: key);

  final List<_ListItem> _items = [
    _ListItem(
        title: "Todo List UI",
        description: "Todo list ui sample",
        page: const TaskSample()),
    _ListItem(
        title: "List UI",
        description: "ListView / GridView / Table are tested.",
        page: const ListSample()),
    _ListItem(
        title: "Counter",
        description: "This is sample for inherited widget.",
        page: const CountPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final navigations = _items.map((item) {
      return InkWell(
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
          ),
          onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => item.page),
              ));
    }).toList();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: navigations),
    );
  }
}
