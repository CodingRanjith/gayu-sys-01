// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/* 
@author     : karthick.d  23/05/2025
@desc       : data class for MastersAPI request payload
@param      : {String setupVersion} - uniquely identifuy the master version and download
              appropriate version master
              {String setupmodule} - to define module type ex:  AGRI , RETAIL , MSME 
              {String setupTypeOfMaster} - unique key to identify the type of master

 */

class MasterRequest {
  final String setupVersion;
  final String setupmodule;
  final String setupTypeOfMaster;
  MasterRequest({
    required this.setupVersion,
    required this.setupmodule,
    required this.setupTypeOfMaster,
  });

  MasterRequest copyWith({
    String? setupVersion,
    String? setupmodule,
    String? setupTypeOfMaster,
  }) {
    return MasterRequest(
      setupVersion: setupVersion ?? this.setupVersion,
      setupmodule: setupmodule ?? this.setupmodule,
      setupTypeOfMaster: setupTypeOfMaster ?? this.setupTypeOfMaster,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setupVersion': setupVersion,
      'setupmodule': setupmodule,
      'setupTypeOfMaster': setupTypeOfMaster,
    };
  }

  factory MasterRequest.fromMap(Map<String, dynamic> map) {
    return MasterRequest(
      setupVersion: map['setupVersion'] as String,
      setupmodule: map['setupmodule'] as String,
      setupTypeOfMaster: map['setupTypeOfMaster'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterRequest.fromJson(String source) =>
      MasterRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MasterRequest(setupVersion: $setupVersion, setupmodule: $setupmodule, setupTypeOfMaster: $setupTypeOfMaster)';

  @override
  bool operator ==(covariant MasterRequest other) {
    if (identical(this, other)) return true;

    return other.setupVersion == setupVersion &&
        other.setupmodule == setupmodule &&
        other.setupTypeOfMaster == setupTypeOfMaster;
  }

  @override
  int get hashCode =>
      setupVersion.hashCode ^ setupmodule.hashCode ^ setupTypeOfMaster.hashCode;
}
