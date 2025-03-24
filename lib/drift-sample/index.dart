import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:todo/databases/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final watchItems = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);


  return database.watchItems();
});

class DatabaesPage extends ConsumerStatefulWidget {
  const DatabaesPage({super.key});

  @override
  ConsumerState<DatabaesPage> createState() => _DatabasePageState();
}

class _DatabasePageState extends ConsumerState<DatabaesPage> {
  
  @override
  Widget build(BuildContext context) {
    final getItems = ref.watch(watchItems);
    // final getItems = database.todoItems.select().get();
    return Scaffold(
      appBar: AppBar(),
      body: getItems.when(
        data: (items) {
          return Flex(
            direction: Axis.vertical,
            children: [
              TextButton(onPressed: _addTodoItem, child: Text('Add to Drift')),
              ...items.map((r) => Text(r.title)),
            ]
          );
        },
        error: (e, s) {
          debugPrintStack(label: e.toString(), stackTrace: s);
          return const Text('An error has occured');
        },
        loading: () => const Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        )
      )
        // builder: (context, snapshot) {
        //   if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        //     final results = snapshot.data!;

        //     return Flex(
        //       direction: Axis.vertical,
        //       children: results.map((r) {
        //       return Text(r.title);
        //     }).toList());
        //   }

        //   
        // },
      // )
    );
  }

  void _addTodoItem() {
      final database = ref.read(AppDatabase.provider);
      // database.managers.todoItems.create((row) => row(title: '', content: ''));
      database.todoItems.insertOne(TodoItemsCompanion.insert(title: 'new title', content: 'new content'));
  }
}
