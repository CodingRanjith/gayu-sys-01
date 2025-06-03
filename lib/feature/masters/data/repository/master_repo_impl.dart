import 'package:dio/dio.dart';
import 'package:newsee/AppData/app_api_constants.dart';
import 'package:newsee/Model/api_core/AsyncResponseHandler.dart';
import 'package:newsee/Model/api_core/auth_failure.dart';
import 'package:newsee/Model/api_core/failure.dart';
import 'package:newsee/core/api/api_client.dart';
import 'package:newsee/core/api/api_config.dart';
import 'package:newsee/core/db/db_config.dart';
import 'package:newsee/feature/masters/data/datasource/masters_remote_datasource.dart';
import 'package:newsee/feature/masters/data/repository/lov_parser_impl.dart';
import 'package:newsee/feature/masters/domain/modal/lov.dart';
import 'package:newsee/feature/masters/domain/modal/master_request.dart';
import 'package:newsee/feature/masters/domain/modal/master_response.dart';
import 'package:newsee/feature/masters/domain/modal/master_types.dart';
import 'package:newsee/feature/masters/domain/modal/post.dart';
import 'package:newsee/feature/masters/domain/repository/lov_crud_repo.dart';
import 'package:newsee/feature/masters/domain/repository/master_repo.dart';
import 'package:sqflite/sqlite_api.dart';

class MasterRepoImpl extends MasterRepo {
  @override
  Future<AsyncResponseHandler<Failure, MasterResponse>> downloadMaster({
    required MasterRequest request,
  }) async {
    /* initializing types required for AsyncResponseHandler Object */

    MasterTypes masterTypes = MasterTypes.lov;
    Database db = await DBConfig().database;
    MasterResponse masterResponse = MasterResponse(
      master: [],
      masterType: masterTypes,
    );
    AuthFailure failure = AuthFailure(message: "");

    try {
      switch (request.setupTypeOfMaster) {
        case ApiConstants.master_key_lov:
          /* Lov Master fetch from API and Save in respective table */
          masterTypes = MasterTypes.lov;
          Response response = await MastersRemoteDatasource(
            dio: ApiClient().getDio(),
          ).downloadMaster(request);
          List<Lov> lovList = LovParserImpl().parseResponse(response);
          if (lovList.isNotEmpty) {
            /* Listofvalue master downloaded and saved in table */

            Iterator<Lov> it = lovList.iterator;
            LovCrudRepo lovCrudRepo = LovCrudRepo(db);
            while (it.moveNext()) {
              lovCrudRepo.save(it.current);
            }

            List<Lov> lovs = await lovCrudRepo.getAll();
            print('lovCrudRepo.getAllTasks() => ${lovs.length}');
            masterResponse = MasterResponse(
              master: lovList,
              masterType: masterTypes,
            );
          } else {
            // api response success : false , process error message
            var errorMessage = response.data['errorDesc'];
            print('on Error request.data["ErrorMessage"] => $errorMessage');
            failure = AuthFailure(message: errorMessage);
          }

        // case ApiConstants.master_key_products:
        //   masterTypes = MasterTypes.products;

        // case ApiConstants.master_key_productschema:
        //   masterTypes = MasterTypes.productschema;

        // default:
        //   break;
      }

      // returning AsyncResponseHandler...

      if (masterResponse.master.isNotEmpty) {
        return AsyncResponseHandler.right(masterResponse);
      } else {
        return AsyncResponseHandler.left(failure);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        print(
          'Connection error: Check if the server is running or use the correct IP/port.',
        );
        return AsyncResponseHandler.left(AuthFailure(message: e.toString()));
      } else {
        print('Dio error: $e');
      }
      return AsyncResponseHandler.left(AuthFailure(message: e.toString()));
    }
  }

  // now lov is a List contains Map<String,dynamic>
}
