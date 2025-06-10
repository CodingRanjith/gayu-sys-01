class TableKeyStatecitymaster {
  TableKeyStatecitymaster._();

  static const String tableName = 'statecitymaster';
  static const String idColumn = 'id';
  static const String stateCode = 'stateCode';
  static const String stateName = 'stateName';
  static const String cityCode = 'cityCode';
  static const String cityName = 'cityName';
  static const String districtCode = 'districtCode';
  static const String districtName = 'districtName';

  static const String createTableQuery = '''
                    CREATE TABLE IF NOT EXISTS $tableName(
            $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $stateCode TEXT,
            $stateName TEXT,
            $cityCode TEXT,
            $cityName TEXT,
            $districtCode TEXT,
            $districtName TEXT
)
  ''';
}
