// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deduperesponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DedupeResponse _$DedupeResponseFromJson(Map<String, dynamic> json) =>
    DedupeResponse(
      CBS: json['CBS'] as bool,
      remarksFlag: json['remarksFlag'] as bool,
      remarks: json['remarks'] as String,
    );

Map<String, dynamic> _$DedupeResponseToJson(DedupeResponse instance) =>
    <String, dynamic>{
      'CBS': instance.CBS,
      'remarksFlag': instance.remarksFlag,
      'remarks': instance.remarks,
    };
