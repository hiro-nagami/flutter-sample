import 'package:flutter/material.dart';
import 'package:todo/inherited-widget-sample/index.dart';
import 'package:todo/list-and-grid-sample/index.dart';
import 'package:todo/main.dart';
import 'package:todo/provider-and-notifier-sample/index.dart';
import 'package:todo/task-sample-only-state/index.dart';
import 'package:todo/task-sample-with-provider/index.dart';

class RouteItem {
  final String title;
  final String description;
  final WidgetBuilder page;
  final String path;

  RouteItem(
      {required this.title, required this.description, required this.page, required this.path});

  Route<dynamic> route() {
    return MaterialPageRoute(builder: page);
  }
}

class RouteGenerator {
  final List<RouteItem> _items = [
    RouteItem(
      title: "List UI",
      description: "ListView / GridView / Table are tested.",
      path: "/list-and-grid-sample",
      page: (BuildContext context) => const ListAndGridSample()),
    RouteItem(
      title: "Counter (InheritedWidget)",
      description: "This is sample for inherited widget.",
      path: "/inherited-widget-sample",
      page: (BuildContext context) => const InheritedWidgetSample()),
    RouteItem(
      title: "Counter (Provider)",
      description: "This is sample for provider.",
      path: "/provider-and-notifier-sample",
      page: (BuildContext context) => const ProviderAndNotifierSample()),
    RouteItem(
      title: "Todo List UI (Only state)",
      description: "Todo list ui sample",
      path: "/task-sample-only-state",
      page: (BuildContext context) => const TaskSampleOnlyState()),
    RouteItem(
      title: "Todo List UI (Provider)",
      description: "Todo list ui sample",
      path: "/task-sample-with-provider",
      page: (BuildContext context) => const TaskSampleWithProvider()),
  ];

  List<RouteItem> get routes => _items;

  Route<dynamic> generate(RouteSettings settings) {
    final String? name = settings.name;
    RouteItem? item;

    for (var route in routes) {
      if (route.path == name) item = route;
    }

    if (item != null) {
      return item.route();
    }

    return MaterialPageRoute(builder: (BuildContext context) => const Main());
  }
}