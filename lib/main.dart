import 'package:flutter/material.dart';
import 'package:todo/databases/connection/shared.dart';
import 'package:todo/drift-sample/index.dart';
import 'package:todo/inherited-widget-sample/index.dart';
import 'package:todo/list-and-grid-sample/index.dart';
import 'package:todo/provider-and-notifier-sample/index.dart';
import 'package:todo/task-sample/index.dart';
import 'package:provider/provider.dart';
import 'package:todo/route_generator.dart';
import 'package:todo/task-sample-with-provider/index.dart';

final database = constructDb();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {};

    return 
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TaskData>.value(value: TaskData())
        ],
        child: MaterialApp(
          title: 'Flutter Samples',
          theme: ThemeData(primarySwatch: Colors.blue,),
          initialRoute: '/',
          routes: routes,
          onGenerateRoute: RouteGenerator().generate,
        ),
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

class Main extends StatelessWidget {
  const Main({super.key});
  
  @override
  Widget build(BuildContext context) {
    final navigation = RouteGenerator().routes.map((item) {
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

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }