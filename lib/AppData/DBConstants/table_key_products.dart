/* 
@author   : karthick.d  26/05/2025
@desc     : class to keep string contants for products table 


 */
import 'package:flutter/material.dart';

@immutable
class TableKeysProducts {
  /* 
                "lsfFacId": "436",
                "lsfFacDesc": "Kisan Credit Card",
                "lsfFacParentId": "426",
                "lsfBizVertical": "7",
 
   */
  TableKeysProducts._();

  static const String tableName = 'products';
  static const String idColumn = 'id';
  static const String facilityId = 'lsfFacId';
  static const String facilityDescription = "lsfFacDesc";
  static const String facilityParentId = "lsfFacParentId";
  static const String vertical = "lsfBizVertical";
  static const String version = 'version';

  static const String createTableQuery = '''
                    CREATE TABLE IF NOT EXISTS $tableName(
            $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $facilityId TEXT,
            $facilityDescription TEXT,
            $facilityParentId TEXT,
            $vertical TEXT,
            $version TEXT
)
  ''';
}
