// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productschema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSchema _$ProductSchemaFromJson(Map<String, dynamic> json) =>
    ProductSchema(
      optionValue: json['optionValue'] as String,
      optionDesc: json['optionDesc'] as String,
      optionId: json['optionId'] as String,
    );

Map<String, dynamic> _$ProductSchemaToJson(ProductSchema instance) =>
    <String, dynamic>{
      'optionValue': instance.optionValue,
      'optionDesc': instance.optionDesc,
      'optionId': instance.optionId,
    };
