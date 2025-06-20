import 'package:newsee/core/api/AsyncResponseHandler.dart';
import 'package:newsee/core/api/failure.dart';
import 'package:newsee/feature/addressdetails/domain/model/citydistrictrequest.dart';

abstract class Cityrepository {
  Future<AsyncResponseHandler<Failure, dynamic>> fetchCityList(
    CityDistrictRequest cityDistrictRequest,
  );
}
