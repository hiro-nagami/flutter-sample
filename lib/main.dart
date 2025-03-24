import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/databases/connection/shared.dart';
import 'package:todo/drift-sample/index.dart';
import 'package:todo/inherited-widget-sample/index.dart';
import 'package:todo/list-and-grid-sample/index.dart';
import 'package:todo/provider-and-notifier-sample/index.dart';
import 'package:todo/task-sample/index.dart';

final database = constructDb();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Samples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BasePage())
    );
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
  BasePage({super.key});

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
        title: "Counter (InheritedWidget)",
        description: "This is sample for inherited widget.",
        page: const CountPage()),
    _ListItem(
        title: "Counter (Provider)",
        description: "This is sample for provider.",
        page: const CountPageWithProvider()),
    _ListItem(
        title: "Drift (Provider)",
        description: "This is sample for provider.",
        page: const DatabaesPage()),
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
