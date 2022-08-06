import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/route_generator.dart';
import 'package:todo/task-sample-with-provider/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {};

    return MultiProvider(
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

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
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