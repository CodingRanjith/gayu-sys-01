// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geography_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeographyMaster _$GeographyMasterFromJson(Map<String, dynamic> json) =>
    GeographyMaster(
      stateParentId: json['stateParentId'] as String,
      cityParentId: json['cityParentId'] as String,
      code: json['code'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$GeographyMasterToJson(GeographyMaster instance) =>
    <String, dynamic>{
      'stateParentId': instance.stateParentId,
      'cityParentId': instance.cityParentId,
      'code': instance.code,
      'value': instance.value,
    };
