// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  lsfFacId: json['lsfFacId'] as String,
  lsfFacDesc: json['lsfFacDesc'] as String,
  lsfFacParentId: json['lsfFacParentId'] as String,
  lsfBizVertical: json['lsfBizVertical'] as String,
  lsfFacType: json['lsfFacType'] as String,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'lsfFacId': instance.lsfFacId,
  'lsfFacDesc': instance.lsfFacDesc,
  'lsfFacParentId': instance.lsfFacParentId,
  'lsfBizVertical': instance.lsfBizVertical,
  'lsfFacType': instance.lsfFacType,
};
