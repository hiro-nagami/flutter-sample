import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:todo/databases/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchItems = StreamProvider((ref) {
  final database = ref.watch(AppDatabase.provider);
  return database.todoItems.all().watch();
});

class DriftPage extends ConsumerStatefulWidget {
  const DriftPage({super.key});

  @override
  ConsumerState<DriftPage> createState() => _DatabasePageState();
}

class _DatabasePageState extends ConsumerState<DriftPage> {
  
  @override
  Widget build(BuildContext context) {
    final getItems = ref.watch(watchItems);

    return ProviderScope(
      child: Scaffold(
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
        ),
      )
    );
  }

  void _addTodoItem() {
      final database = ref.read(AppDatabase.provider);
      // database.managers.todoItems.create((row) => row(title: '', content: ''));
      database.todoItems.insertOne(TodoItemsCompanion.insert(title: 'new title', content: 'new content'));
  }
}
