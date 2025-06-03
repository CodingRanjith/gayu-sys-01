// lib/feature/cif/domain/model/user/chif_response_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'chif_response_model.g.dart';

@JsonSerializable()
class ChifResponseModel {
  @JsonKey(name: 'LPuserID')
  final String custId;

  final String uniqueId;
  final String cifId;
  final String type;
  final String token;

  ChifResponseModel({
    required this.custId,
    required this.uniqueId,
    required this.cifId,
    required this.type,
    required this.token,
  });

  factory ChifResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChifResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChifResponseModelToJson(this);
}
