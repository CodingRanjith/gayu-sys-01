import 'package:dio/src/response.dart';
import 'package:newsee/feature/masters/domain/modal/lov.dart';
import 'package:newsee/feature/masters/domain/repository/masters_response_parser.dart';

class LovParserImpl implements MastersResponseParser<Lov> {
  @override
  List<Lov> parseResponse(Response response) {
    final setupmaster = response.data['Setupmaster'];
    if (setupmaster != null && setupmaster['Listofvalues'] != null) {
      List<dynamic> listofvalues = setupmaster['Listofvalues'];
      List<Lov> lovList = listofvalues.map((e) => Lov.fromMap(e)).toList();
      return lovList;
    } else {
      List<Lov> lovList = [];
      return lovList;
    }
  }
}
