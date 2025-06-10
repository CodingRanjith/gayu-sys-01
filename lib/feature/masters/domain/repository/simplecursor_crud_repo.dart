mixin SimplecursorCrudRepo<T> {
  Future<List<T>> getById({required int id});
  Future<List<T>> getByColumnName({
    required String columnName,
    required String columnValue,
  });
  Future<List<T>> getByColumnNames({
    required List<String> columnNames,
    required List<String> columnValues,
  });
}
