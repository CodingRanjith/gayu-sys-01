import 'dart:convert';

/* @author   : Rajesh.S 10/06/2025
@desc        : Represents a request for Aadhaar validation.
This class encapsulates the Aadhaar number required for validation and provides
utility methods for object manipulation, serialization, and deserialization.
*/

class AadharvalidateRequest {
  final String? aadhaarNumber;
  AadharvalidateRequest({this.aadhaarNumber});

  AadharvalidateRequest copyWith({String? aadhaarNumber}) {
    return AadharvalidateRequest(
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {'aadhaarNumber': aadhaarNumber};
  }

  factory AadharvalidateRequest.fromMap(Map<String, dynamic> map) {
    return AadharvalidateRequest(
      aadhaarNumber:
          map['aadhaarNumber'] != null ? map['aadhaarNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AadharvalidateRequest.fromJson(String source) =>
      AadharvalidateRequest.fromMap(json.decode(source));

  @override
  String toString() => 'AadharvalidateRequest(aadhaarNumber: $aadhaarNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AadharvalidateRequest &&
        other.aadhaarNumber == aadhaarNumber;
  }

  @override
  int get hashCode => aadhaarNumber.hashCode;
}
