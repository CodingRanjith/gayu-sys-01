// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statecitymaster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statecitymaster _$StatecitymasterFromJson(Map<String, dynamic> json) =>
    Statecitymaster(
      stateCode: json['stateCode'] as String,
      stateName: json['stateName'] as String,
      cityCode: json['cityCode'] as String,
      cityName: json['cityName'] as String,
      districtCode: json['districtCode'] as String,
      districtName: json['districtName'] as String,
    );

Map<String, dynamic> _$StatecitymasterToJson(Statecitymaster instance) =>
    <String, dynamic>{
      'stateCode': instance.stateCode,
      'stateName': instance.stateName,
      'cityCode': instance.cityCode,
      'cityName': instance.cityName,
      'districtCode': instance.districtCode,
      'districtName': instance.districtName,
    };
