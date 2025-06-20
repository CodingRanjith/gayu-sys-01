import 'package:newsee/AppData/DBConstants/table_key_geographymaster.dart';
import 'package:newsee/Utils/query_builder.dart';
import 'package:newsee/feature/masters/domain/modal/geography_master.dart';
import 'package:newsee/feature/masters/domain/repository/simple_crud_repo.dart';
import 'package:newsee/feature/masters/domain/repository/simplecursor_crud_repo.dart';
import 'package:sqflite/sqlite_api.dart';

class GeographymasterCrudRepo extends SimpleCrudRepo<GeographyMaster>
    with SimplecursorCrudRepo<GeographyMaster> {
  final Database _db;
  GeographymasterCrudRepo(this._db);

  @override
  Future<int> delete(GeographyMaster o) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<GeographyMaster>> getAll() async {
    final List<Map<String, dynamic>> data = await _db.query(
      TableKeysGeographyMaster.tableName,
      orderBy: 'id DESC',
    );
    print("retdata $data");
    return List.generate(
      data.length,
      (index) => GeographyMaster.fromJson(data[index]),
    );
  }

  @override
  Future<int> save(GeographyMaster o) async {
    return _db.transaction((txn) async {
      return await txn.insert(
        TableKeysGeographyMaster.tableName,
        o.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<int> update(GeographyMaster o) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<GeographyMaster>> getByColumnName({
    required String columnName,
    required String columnValue,
  }) async {
    final data = await _db.query(
      TableKeysGeographyMaster.tableName,
      where: '$columnName=?',
      whereArgs: [columnValue],
    );
    return List.generate(
      data.length,
      (index) => GeographyMaster.fromJson(data[index]),
    );
  }

  @override
  Future<List<GeographyMaster>> getByColumnNames({
    required List<String> columnNames,
    required List<String> columnValues,
  }) async {
    final query = queryBuilder(columnNames);
    final data = await _db.query(
      TableKeysGeographyMaster.tableName,
      where: query,
      whereArgs: columnValues,
    );
    return List.generate(
      data.length,
      (index) => GeographyMaster.fromJson(data[index]),
    );
  }

  @override
  Future<List<GeographyMaster>> getById({required int id}) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
