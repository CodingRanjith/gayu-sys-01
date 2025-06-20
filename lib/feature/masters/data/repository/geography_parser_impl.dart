/* 
@author   : karthick.D 11/06/2025
@desc     : This class extends MastersResponseParser and provides the implementation 
            for parsing the statecity master. This class is responsible for parsing the response obtained from the API
            for state and city master data and converting it into a list of [GeographyMaster] objects.
@param    :- [response]: The [Response] object containing the API data to be parsed.
@return   : - A list of [GeographyMaster] objects created from the parsed response data.
*/

import 'package:dio/src/response.dart';
import 'package:newsee/feature/masters/domain/modal/geography_master.dart';
import 'package:newsee/feature/masters/domain/repository/masters_response_parser.dart';

class GeographyParserImpl extends MastersResponseParser<GeographyMaster> {
  @override
  List<GeographyMaster> parseResponse(Response response) {
    final setupmaster = response.data['Setupmaster'];
    if (setupmaster != null && setupmaster['StateMaster'] != null) {
      List<dynamic> listofvalues = setupmaster['StateMaster'];
      List<GeographyMaster> statecityList =
          listofvalues.map((e) {
            e['stateParentId'] = "0";
            e['cityParentId'] = "0";
            return GeographyMaster.fromMap(e);
          }).toList();
      return statecityList;
    } else {
      List<GeographyMaster> statecityList = [];
      return statecityList;
    }
  }
}
