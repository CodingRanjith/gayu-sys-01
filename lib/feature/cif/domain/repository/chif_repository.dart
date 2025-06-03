import 'package:newsee/Model/api_core/AsyncResponseHandler.dart';
import 'package:newsee/Model/api_core/failure.dart';
import 'package:newsee/feature/cif/domain/model/user/chif_response_model.dart';

abstract class ChifRepository {
  Future<AsyncResponseHandler<Failure, ChifResponseModel>> searchCif(
    Map<String, dynamic> req,
  );
}
