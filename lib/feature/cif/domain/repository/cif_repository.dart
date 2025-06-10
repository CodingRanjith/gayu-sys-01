
import 'package:newsee/core/api/AsyncResponseHandler.dart';
import 'package:newsee/core/api/failure.dart';
import 'package:newsee/feature/cif/domain/model/user/cif_request.dart';
import 'package:newsee/feature/cif/domain/model/user/cif_response_model.dart';

abstract class CifRepository {
  Future<AsyncResponseHandler<Failure, CifResponseModel>> searchCif(
    CIFRequest req,
  );
}


