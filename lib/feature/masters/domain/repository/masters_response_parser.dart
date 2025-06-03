import 'package:dio/dio.dart';

abstract class MastersResponseParser<T> {
  List<T> parseResponse(Response response);
}
