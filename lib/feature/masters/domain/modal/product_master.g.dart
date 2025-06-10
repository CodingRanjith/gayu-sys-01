// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMaster _$ProductMasterFromJson(Map<String, dynamic> json) =>
    ProductMaster(
      prdCode: json['prdCode'] as String,
      prdDesc: json['prdDesc'] as String,
      prdamtFromRange: json['prdamtFromRange'] as String,
      prdamtToRange: json['prdamtToRange'] as String,
      prdMainCat: json['prdMainCat'] as String,
      prdSubCat: json['prdSubCat'] as String,
      prdTenorFrom: json['prdTenorFrom'] as String,
      prdTenorTo: json['prdTenorTo'] as String,
    );

Map<String, dynamic> _$ProductMasterToJson(ProductMaster instance) =>
    <String, dynamic>{
      'prdCode': instance.prdCode,
      'prdDesc': instance.prdDesc,
      'prdamtFromRange': instance.prdamtFromRange,
      'prdamtToRange': instance.prdamtToRange,
      'prdMainCat': instance.prdMainCat,
      'prdSubCat': instance.prdSubCat,
      'prdTenorFrom': instance.prdTenorFrom,
      'prdTenorTo': instance.prdTenorTo,
    };
