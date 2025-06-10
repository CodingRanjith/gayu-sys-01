import 'package:newsee/AppData/DBConstants/table_key_statecitymaster.dart';
import 'package:newsee/feature/masters/domain/modal/statecitymaster.dart';
import 'package:newsee/feature/masters/domain/repository/simple_crud_repo.dart';
import 'package:sqflite/sqlite_api.dart';

class StatecityMasterCrudRepo extends SimpleCrudRepo<Statecitymaster> {
  final Database _db;
  StatecityMasterCrudRepo(this._db);

  @override
  Future<int> save(Statecitymaster o) async {
    return _db.transaction((txn) async {
      return await txn.insert(
        TableKeyStatecitymaster.tableName,
        o.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<int> delete(Statecitymaster o) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Statecitymaster>> getAll() async {
    final List<Map<String, dynamic>> data = await _db.query(
      TableKeyStatecitymaster.tableName,
      orderBy: 'id DESC',
    );
    print("retdata $data");
    return List.generate(
      data.length,
      (index) => Statecitymaster.fromJson(data[index]),
    );
  }

  @override
  Future<int> update(Statecitymaster o) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
