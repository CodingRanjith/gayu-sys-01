import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsee/Model/api_core/AsyncResponseHandler.dart';
import 'package:newsee/Model/api_core/failure.dart';
import 'package:newsee/Model/api_core/auth_failure.dart';
import 'package:newsee/feature/cif/data/datasource/chif_remote_datasource.dart';
import 'package:newsee/feature/cif/domain/model/user/chif_response_model.dart';
import 'package:newsee/feature/cif/domain/repository/chif_repository.dart';

class ChifRepositoryImpl implements ChifRepository {
  final ChifRemoteDatasource chifRemoteDatasource;

  ChifRepositoryImpl({required this.chifRemoteDatasource});

  /*
  @author         : Gayathri 03/06/2025
  @desc           : Implements searchCif from ChifRepository
                    Uses chifRemoteDatasource to call the API
  @return         : Future<AsyncResponseHandler<Failure, ChifResponseModel>>
  */
  @override
  Future<AsyncResponseHandler<Failure, ChifResponseModel>> searchCif(
    Map<String, dynamic> req,
  ) async {
    try {
      print('CIF Search request payload => $req');
      var response = await chifRemoteDatasource.searchCif(req);

      if (response.data['Success']) {
        var cifResponse = ChifResponseModel.fromJson(
          response.data['responseData'],
        );
        print('ChifResponseModel => ${cifResponse.toString()}');
        return AsyncResponseHandler.right(cifResponse);
      } else {
        var errorMessage = response.data['ErrorMessage'] ?? "Unknown error";
        print('CIF Search error => $errorMessage');
        return AsyncResponseHandler.left(AuthFailure(message: errorMessage));
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return AsyncResponseHandler.left(
          AuthFailure(
            message: "Could not reach server. Please try again later.",
          ),
        );
      }
      return AsyncResponseHandler.left(
        AuthFailure(message: "Server Error Occurred"),
      );
    } on Exception {
      return AsyncResponseHandler.left(
        AuthFailure(message: "Unexpected Failure during CIF Search"),
      );
    }
  }
}
