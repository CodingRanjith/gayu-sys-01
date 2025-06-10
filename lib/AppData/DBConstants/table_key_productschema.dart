/* 
@author   : karthick.d  26/05/2025
@desc     : class to keep string contants for products table 


 */
import 'package:flutter/material.dart';

@immutable
class TableKeysProductSchema {
  TableKeysProductSchema._();

  static const String tableName = 'productschema';
  static const String idColumn = 'id';
  static const String optionValue = 'optionValue';
  static const String optionDesc = 'optionDesc';
  static const String optionId = 'optionId';

  static const String createTableQuery = '''
                    CREATE TABLE IF NOT EXISTS $tableName(
            $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $optionValue TEXT,
            $optionDesc TEXT,
            $optionId TEXT
)
  ''';
}
