import 'package:newsee/core/api/AsyncResponseHandler.dart';
import 'package:newsee/core/api/failure.dart';
import 'package:newsee/feature/dedupe/domain/model/deduperequest.dart';

abstract class DedupeRepository {
  Future<AsyncResponseHandler<Failure, dynamic>> dedupeSearchforCustomer(
    DedupeRequest dedupeRequest,
  );
}
