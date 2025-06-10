import 'package:newsee/AppData/DBConstants/table_key_products.dart';
import 'package:newsee/Utils/query_builder.dart';
import 'package:newsee/feature/masters/domain/modal/product.dart';
import 'package:newsee/feature/masters/domain/repository/simple_crud_repo.dart';
import 'package:newsee/feature/masters/domain/repository/simplecursor_crud_repo.dart';
import 'package:sqflite/sqflite.dart';

class ProductsCrudRepo extends SimpleCrudRepo<Product>
    with SimplecursorCrudRepo<Product> {
  final Database _db;

  ProductsCrudRepo(this._db);

  @override
  Future<int> delete(Product o) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAll() async {
    final List<Map<String, dynamic>> data = await _db.query(
      TableKeysProducts.tableName,
      orderBy: "id DESC",
    );
    return List.generate(data.length, (index) => Product.fromJson(data[index]));
  }

  @override
  Future<int> save(Product o) async {
    return _db.transaction((txn) async {
      return await txn.insert(
        TableKeysProducts.tableName,
        o.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<int> update(Product o) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getByColumnName({
    required String columnName,
    required String columnValue,
  }) async {
    final data = await _db.query(
      TableKeysProducts.tableName,
      where: '$columnName=?',
      whereArgs: [columnValue],
    );
    return List.generate(data.length, (index) => Product.fromJson(data[index]));
  }

  @override
  Future<List<Product>> getByColumnNames({
    required List<String> columnNames,
    required List<String> columnValues,
  }) async {
    final query = queryBuilder(columnNames);
    final data = await _db.query(
      TableKeysProducts.tableName,
      where: query,
      whereArgs: columnValues,
    );
    return List.generate(data.length, (index) => Product.fromJson(data[index]));
  }

  @override
  Future<List<Product>> getById({required int id}) async {
    final data = await _db.query(
      TableKeysProducts.tableName,
      where: "id=?",
      whereArgs: [id],
    );
    return List.generate(data.length, (index) => Product.fromJson(data[index]));
  }
}
