import 'package:dio/dio.dart';
import 'package:newsee/feature/masters/domain/modal/statecitymaster.dart';
import 'package:newsee/feature/masters/domain/repository/masters_response_parser.dart';

class StatecityParserImpl extends MastersResponseParser<Statecitymaster> {
  @override
  List<Statecitymaster> parseResponse(Response response) {
    final setupmaster = response.data['Setupmaster'];
    if (setupmaster != null && setupmaster['StateCityMaster'] != null) {
      List<dynamic> listofvalues = setupmaster['StateCityMaster'];
      List<Statecitymaster> statecityList =
          listofvalues.map((e) => Statecitymaster.fromMap(e)).toList();
      return statecityList;
    } else {
      List<Statecitymaster> statecityList = [];
      return statecityList;
    }
  }
}
