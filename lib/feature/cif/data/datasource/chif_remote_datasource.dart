import 'package:dio/dio.dart';
import 'package:newsee/core/api/api_config.dart';

class ChifRemoteDatasource {
  final Dio dio;

  ChifRemoteDatasource({required this.dio});

  /*
  @author     : Gayathri 03/06/2025
  @desc       : CIF Search API consumer using dio.post method
                Follows same structure as login datasource
  @param      : http request payload (must include token, deviceId, userid)
  @return     : Future<Response> - raw HTTP response from CIFSearch API
  */
  Future<Response> searchCif(Map<String, dynamic> payload) async {
    Response response = await dio.post(
      'MobileService/CIFSearch',
      data: payload,
      options: Options(
        headers: {
          'token': payload['token'] ?? ApiConfig.AUTH_TOKEN,
          'deviceId': payload['deviceId'],
          'userid': payload['userid'],
        },
      ),
    );
    return response;
  }
}
