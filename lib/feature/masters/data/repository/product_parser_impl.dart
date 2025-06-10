import 'package:dio/src/response.dart';
import 'package:newsee/feature/masters/domain/modal/product.dart';
import 'package:newsee/feature/masters/domain/repository/masters_response_parser.dart';

class ProductParserImpl extends MastersResponseParser<Product> {
  @override
  List<Product> parseResponse(Response response) {
    final setupmaster = response.data['Setupmaster'];
    if (setupmaster != null &&
        setupmaster['SubCategoryMaster'] != null &&
        setupmaster['MainCategoryMaster'] != null) {
      List subcategoryData = setupmaster['SubCategoryMaster'];
      List maincategoryData = setupmaster['MainCategoryMaster'];

      List<Product> subcatList =
          subcategoryData.map((e) => Product.fromMap(e)).toList();
      List<Product> maincatList =
          maincategoryData.map((e) => Product.fromMap(e)).toList();
      return [...subcatList, ...maincatList];
    } else {
      List<Product> lovList = [];
      return lovList;
    }
  }
}
