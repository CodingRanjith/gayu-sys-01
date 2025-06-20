import 'package:dio/dio.dart';
import 'package:newsee/feature/masters/domain/modal/statecitymaster.dart';
import 'package:newsee/feature/masters/domain/repository/masters_response_parser.dart';

/* 
@author   : Rajesh.S 05/06/2025
@desc     : This class extends MastersResponseParser and provides the implementation 
for parsing the statecity master. This class is responsible for parsing the response obtained from the API
for state and city master data and converting it into a list of [Statecitymaster] objects.
Parameters:- [response]: The [Response] object containing the API data to be parsed.
Returns: - A list of [Statecitymaster] objects created from the parsed response data.
*/

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
