/* 
@author   : karthick.d  26/05/2025
@desc     : class to keep string contants for lov table 


 */
import 'package:flutter/material.dart';

@immutable
class TableKeysLov {
  TableKeysLov._();

  static const String tableName = 'lov';
  static const String _idColumn = 'id';
  static const String _header = 'Header';
  static const String _optValue = 'optvalue';
  static const String _optDesc = 'optDesc';
  static const String _optCode = 'optCode';
  static const String _version = 'version';

  static const String createTableQuery = '''
                CREATE TABLE IF NOT EXISTS ${TableKeysLov.tableName}(
            ${TableKeysLov._idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${TableKeysLov._header} TEXT,
            ${TableKeysLov._optValue} TEXT,
            ${TableKeysLov._optDesc} TEXT,
            ${TableKeysLov._optCode} TEXT,
            ${TableKeysLov._version} TEXT
                      )

     ''';
}
