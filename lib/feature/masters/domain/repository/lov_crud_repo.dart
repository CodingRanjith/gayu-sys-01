import 'package:newsee/AppData/DBConstants/dbconstants.dart';
import 'package:newsee/core/db/db_config.dart';
import 'package:newsee/feature/masters/domain/modal/lov.dart';
import 'package:newsee/feature/masters/domain/repository/simple_crud_repo.dart';
import 'package:sqflite/sqlite_api.dart';

class LovCrudRepo extends SimpleCrudRepo<Lov> {
  final Database _db;

  LovCrudRepo(this._db);

  @override
  Future<int> save(Lov o) async {
    return _db.transaction((txn) async {
      return await txn.insert(
        TableKeysLov.tableName,
        o.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<int> delete(Lov o) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<int> update(Lov o) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<List<Lov>> getAll() async {
    final List<Map<String, dynamic>> data = await _db.query(
      TableKeysLov.tableName,
      orderBy: "id DESC",
    );
    return List.generate(data.length, (index) => Lov.fromJson(data[index]));
  }
}
