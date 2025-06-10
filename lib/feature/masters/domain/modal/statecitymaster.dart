import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'statecitymaster.g.dart';

/* 
@author    : rajesh.s 03/06/2025
@desc      : data class for State city Model
@param     : {String stateCode} - State code (eg. 33 for tamilnadu)
             {String stateName} - State name (eg. tamilnadu)
             {String cityCode} - city code (eg. 243 for chennai)
             {String cityName} - State name (eg. chennai)
             {String districtCode} - district code (eg. 243 for chennai)
             {String districtName} - district name (eg. chennai)

             **/

@JsonSerializable()
class Statecitymaster {
  final String stateCode;
  final String stateName;
  final String cityCode;
  final String cityName;
  final String districtCode;
  final String districtName;
  Statecitymaster({
    required this.stateCode,
    required this.stateName,
    required this.cityCode,
    required this.cityName,
    required this.districtCode,
    required this.districtName,
  });

  Statecitymaster copyWith({
    String? stateCode,
    String? stateName,
    String? cityCode,
    String? cityName,
    String? districtCode,
    String? districtName,
  }) {
    return Statecitymaster(
      stateCode: stateCode ?? this.stateCode,
      stateName: stateName ?? this.stateName,
      cityCode: cityCode ?? this.cityCode,
      cityName: cityName ?? this.cityName,
      districtCode: districtCode ?? this.districtCode,
      districtName: districtName ?? this.districtName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stateCode': stateCode,
      'stateName': stateName,
      'cityCode': cityCode,
      'cityName': cityName,
      'districtCode': districtCode,
      'districtName': districtName,
    };
  }

  factory Statecitymaster.fromMap(Map<String, dynamic> map) {
    return Statecitymaster(
      stateCode: map['stateCode'] ?? '',
      stateName: map['stateName'] ?? '',
      cityCode: map['cityCode'] ?? '',
      cityName: map['cityName'] ?? '',
      districtCode: map['districtCode'] ?? '',
      districtName: map['districtName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Statecitymaster.fromJson(Map<String, dynamic> json) =>
      _$StatecitymasterFromJson(json);

  @override
  String toString() {
    return 'Statecitymaster(stateCode: $stateCode, stateName: $stateName, cityCode: $cityCode, cityName: $cityName, districtCode: $districtCode, districtName: $districtName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Statecitymaster &&
        other.stateCode == stateCode &&
        other.stateName == stateName &&
        other.cityCode == cityCode &&
        other.cityName == cityName &&
        other.districtCode == districtCode &&
        other.districtName == districtName;
  }

  @override
  int get hashCode {
    return stateCode.hashCode ^
        stateName.hashCode ^
        cityCode.hashCode ^
        cityName.hashCode ^
        districtCode.hashCode ^
        districtName.hashCode;
  }
}
