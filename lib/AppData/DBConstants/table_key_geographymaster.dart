/* 
@author   : karthick.d  11/06/2025
@desc     : class to keep string contants for geographymaster table 


 */
import 'package:flutter/material.dart';

@immutable
class TableKeysGeographyMaster {
  TableKeysGeographyMaster._();

  static const String tableName = 'geographymaster';
  static const String _idColumn = 'id';
  static const String _stateId = 'stateParentId';
  static const String _cityId = 'cityParentId';
  static const String _code = 'code';
  static const String _value = 'value';

  static const String createTableQuery = '''
                CREATE TABLE IF NOT EXISTS ${TableKeysGeographyMaster.tableName}(
            ${TableKeysGeographyMaster._idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${TableKeysGeographyMaster._stateId} TEXT,
            ${TableKeysGeographyMaster._cityId} TEXT,
            ${TableKeysGeographyMaster._code} TEXT,
            ${TableKeysGeographyMaster._value} TEXT
                      )

     ''';

  static String get stateId => _stateId;
  static String get cityId => _cityId;
}
