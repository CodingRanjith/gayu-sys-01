/* 
@author     : karthick.d  26/05/2025
@desc       : configure sqlite database 
              create database return db instance
              dbinstance 
 */

import 'package:newsee/AppData/DBConstants/dbconstants.dart';
import 'package:newsee/AppData/DBConstants/table_key_products.dart';
import 'package:newsee/AppData/DBConstants/table_key_productschema.dart';
import 'package:newsee/AppData/DBConstants/table_keys_productmaster.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBConfig {
  static final DBConfig _instance = DBConfig._();
  factory DBConfig() => _instance;
  static Database? _database;

  DBConfig._() {
    _initDB();
  }

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbKeys.dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    try {
      // create table sequentially

      await db.execute(TableKeysLov.createTableQuery);
      printTableCreateSuccess(TableKeysLov.tableName);
      await db.execute(TableKeysProductSchema.createTableQuery);
      printTableCreateSuccess(TableKeysProductSchema.tableName);
      await db.execute(TableKeysProducts.createTableQuery);
      printTableCreateSuccess(TableKeysProducts.tableName);
    } catch (e) {
      // db creation failure - > log u r exception

      print('create table error => ${e.toString()} ');
    }
  }

  void printTableCreateSuccess(String tableName) {
    print('create table success => $tableName ');
  }
}
