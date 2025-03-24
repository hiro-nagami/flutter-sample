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
}