import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo/databases/connection/shared.dart';
import 'package:todo/databases/table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TodoItems])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  static final StateProvider<AppDatabase> provider = StateProvider((ref) {
    final database = constructDb();
    ref.onDispose(database.close);

    return database;
  });

  Stream<List<TodoItem>> watchItems() {
    // final query = select().join([
    //   leftOuterJoin(categories, categories.id.equalsExp(todoEntries.category))
    // ]);

    return todoItems.all().watch();

    // if (categoryId != null) {
    //   query.where(categories.id.equals(categoryId));
    // } else {
    //   query.where(categories.id.isNull());
    // }

    // return query.map((row) {
    //   return TodoEntryWithCategory(
    //     entry: row.readTable(todoEntries),
    //     category: row.readTableOrNull(categories),
    //   );
    // }).watch();
  }

  Future<List<TodoItem>> search(String query) {
    return select(todoItems).get();
  }
}