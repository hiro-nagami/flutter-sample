import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:todo/databases/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatabaesPage extends ConsumerStatefulWidget {
  const DatabaesPage({super.key});

  @override
  ConsumerState<DatabaesPage> createState() => _DatabasePageState();
}

class _DatabasePageState extends ConsumerState<DatabaesPage> {
  // InheritedWidget経由でアクセスできる
  // db.managers.users.create((row) => row(username: 'firstuser'));
  // createRow() => database.managers.todoItems.create((row) => row(title: 'タイトル', content: '内容'));
  // getTodoItems() => database.todoItems.all().get();

  @override
  Widget build(BuildContext context) {
    final database = ref.watch(AppDatabase.provider);
    final getItems = database.todoItems.select().get();
    return Scaffold(
      appBar: AppBar(),
      // body: ListView(children: [
      //   Text('data'),
      //   Text('data'),
      //   TextButton(onPressed: _addTodoItem, child: Text('Add to Drift')),
      // ],),
      body: FutureBuilder<List<TodoItem>>(
        future: getItems,
        builder: (context, snapshot) {
          print(snapshot);
          print(snapshot.data);
          print(snapshot.data?.isNotEmpty);
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final results = snapshot.data!;
            return Flex(
              direction: Axis.vertical,
              children: results.map((r) {
                print(r.title);
                return Text(r.title);
              }).toList(),
            );
            // return ListView(
            //   children: [
              //   return ListView.builder(
              //     itemCount: results.length,
              //     itemBuilder: (context, index) {
              //       return Text(results[index].title);
              //     },
              //   // ),
              //   );
              // // TextButton(onPressed: _addTodoItem, child: Text('Add to Drift'))
          //   ],
          // );
          }

          return TextButton(onPressed: _addTodoItem, child: Text('Add to Drift'));
        },
      )
    );
  }

  void _addTodoItem() {
      // We write the entry here. Notice how we don't have to call setState()
      // or anything - drift will take care of updating the list automatically.
      final database = ref.read(AppDatabase.provider);
    database.todoItems.insertOne(TodoItemsCompanion.insert(title: 'new title', content: 'new content'));
  }
}
