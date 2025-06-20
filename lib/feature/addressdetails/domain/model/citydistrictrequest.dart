import 'dart:convert';

import 'package:flutter/widgets.dart';

class CityDistrictRequest {
  final String stateCode;
  final String? cityCode;
  CityDistrictRequest({required this.stateCode, this.cityCode});

  CityDistrictRequest copyWith({
    String? stateCode,
    ValueGetter<String?>? cityCode,
  }) {
    return CityDistrictRequest(
      stateCode: stateCode ?? this.stateCode,
      cityCode: cityCode != null ? cityCode() : this.cityCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {'stateCode': stateCode, 'cityCode': cityCode};
  }

  factory CityDistrictRequest.fromMap(Map<String, dynamic> map) {
    return CityDistrictRequest(
      stateCode: map['stateCode'] ?? '',
      cityCode: map['cityCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CityDistrictRequest.fromJson(String source) =>
      CityDistrictRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'CityDistrictRequest(stateCode: $stateCode, cityCode: $cityCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityDistrictRequest &&
        other.stateCode == stateCode &&
        other.cityCode == cityCode;
  }

  @override
  int get hashCode => stateCode.hashCode ^ cityCode.hashCode;
}
