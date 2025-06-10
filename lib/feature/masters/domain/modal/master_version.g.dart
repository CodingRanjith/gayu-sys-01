// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterVersion _$MasterVersionFromJson(Map<String, dynamic> json) =>
    MasterVersion(
      mastername: json['mastername'] as String,
      version: json['version'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$MasterVersionToJson(MasterVersion instance) =>
    <String, dynamic>{
      'mastername': instance.mastername,
      'version': instance.version,
      'status': instance.status,
    };
