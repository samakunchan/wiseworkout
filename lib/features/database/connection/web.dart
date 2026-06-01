import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

QueryExecutor openConnection() {
  return DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'wiseworkout',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('worker.dart.js'),
    );
    return result.resolvedExecutor;
  }));
}
