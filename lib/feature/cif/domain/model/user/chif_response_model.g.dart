// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chif_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChifResponseModel _$ChifResponseModelFromJson(Map<String, dynamic> json) =>
    ChifResponseModel(
      custId: json['LPuserID'] as String,
      uniqueId: json['uniqueId'] as String,
      cifId: json['cifId'] as String,
      type: json['type'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$ChifResponseModelToJson(ChifResponseModel instance) =>
    <String, dynamic>{
      'LPuserID': instance.custId,
      'uniqueId': instance.uniqueId,
      'cifId': instance.cifId,
      'type': instance.type,
      'token': instance.token,
    };
