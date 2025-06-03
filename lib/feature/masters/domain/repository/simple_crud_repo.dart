abstract class SimpleCrudRepo<T> {
  Future<List<T>> getAll();
  Future<int> save(T o);
  Future<int> update(T o);
  Future<int> delete(T o);
}
