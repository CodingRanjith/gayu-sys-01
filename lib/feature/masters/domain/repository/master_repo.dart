import 'package:newsee/Model/api_core/AsyncResponseHandler.dart';
import 'package:newsee/Model/api_core/failure.dart';
import 'package:newsee/feature/masters/domain/modal/master_request.dart';
import 'package:newsee/feature/masters/domain/modal/master_response.dart';

abstract class MasterRepo {
  Future<AsyncResponseHandler<Failure, MasterResponse>> downloadMaster({
    required MasterRequest request,
  });
}
