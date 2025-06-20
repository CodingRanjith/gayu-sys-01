import 'dart:convert';

/* @author   : Rajesh.S 10/06/2025
@desc        : A model class to represent the response for Aadhaar validation.
*/

class AadharvalidateResponse {
  final String pincode;
  final String country;
  final String gender;
  final String documentType;
  final String xmlBase64;
  final String locality;
  final String mobile;
  final String dateOfBirth;
  final String maskAadhaarNumber;
  final String house;
  final String referenceId;
  final String responseCode;
  final String careOf;
  final String street;
  final String district;
  final String name;
  final String postOfficeName;
  final String vtcName;
  final String photoBase64;
  final String state;
  final String landmark;
  final String responseMessage;
  final String subDistrict;
  final String email;

  AadharvalidateResponse({
    this.pincode = "",
    this.country = "",
    this.gender = "",
    this.documentType = "",
    this.xmlBase64 = "",
    this.locality = "",
    this.mobile = "",
    this.dateOfBirth = "",
    this.maskAadhaarNumber = "",
    this.house = "",
    this.referenceId = "",
    this.responseCode = "",
    this.careOf = "",
    this.street = "",
    this.district = "",
    this.name = "",
    this.postOfficeName = "",
    this.vtcName = "",
    this.photoBase64 = "",
    this.state = "",
    this.landmark = "",
    this.responseMessage = "",
    this.subDistrict = "",
    this.email = "",
  });

  AadharvalidateResponse copyWith({
    String? pincode,
    String? country,
    String? gender,
    String? documentType,
    String? xmlBase64,
    String? locality,
    String? mobile,
    String? dateOfBirth,
    String? maskAadhaarNumber,
    String? house,
    String? referenceId,
    String? responseCode,
    String? careOf,
    String? street,
    String? district,
    String? name,
    String? postOfficeName,
    String? vtcName,
    String? photoBase64,
    String? state,
    String? landmark,
    String? responseMessage,
    String? subDistrict,
    String? email,
  }) {
    return AadharvalidateResponse(
      pincode: pincode ?? this.pincode,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      documentType: documentType ?? this.documentType,
      xmlBase64: xmlBase64 ?? this.xmlBase64,
      locality: locality ?? this.locality,
      mobile: mobile ?? this.mobile,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      maskAadhaarNumber: maskAadhaarNumber ?? this.maskAadhaarNumber,
      house: house ?? this.house,
      referenceId: referenceId ?? this.referenceId,
      responseCode: responseCode ?? this.responseCode,
      careOf: careOf ?? this.careOf,
      street: street ?? this.street,
      district: district ?? this.district,
      name: name ?? this.name,
      postOfficeName: postOfficeName ?? this.postOfficeName,
      vtcName: vtcName ?? this.vtcName,
      photoBase64: photoBase64 ?? this.photoBase64,
      state: state ?? this.state,
      landmark: landmark ?? this.landmark,
      responseMessage: responseMessage ?? this.responseMessage,
      subDistrict: subDistrict ?? this.subDistrict,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pincode': pincode,
      'country': country,
      'gender': gender,
      'documentType': documentType,
      'xmlBase64': xmlBase64,
      'locality': locality,
      'mobile': mobile,
      'dateOfBirth': dateOfBirth,
      'maskAadhaarNumber': maskAadhaarNumber,
      'house': house,
      'referenceId': referenceId,
      'responseCode': responseCode,
      'careOf': careOf,
      'street': street,
      'district': district,
      'name': name,
      'postOfficeName': postOfficeName,
      'vtcName': vtcName,
      'photoBase64': photoBase64,
      'state': state,
      'landmark': landmark,
      'responseMessage': responseMessage,
      'subDistrict': subDistrict,
      'email': email,
    };
  }

  factory AadharvalidateResponse.fromMap(Map<String, dynamic> map) {
    return AadharvalidateResponse(
      pincode: map['pincode'] ?? '',
      country: map['country'] ?? '',
      gender: map['gender'] ?? '',
      documentType: map['documentType'] ?? '',
      xmlBase64: map['xmlBase64'] ?? '',
      locality: map['locality'] ?? '',
      mobile: map['mobile'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      maskAadhaarNumber: map['maskAadhaarNumber'] ?? '',
      house: map['house'] ?? '',
      referenceId: map['referenceId'] ?? '',
      responseCode: map['responseCode'] ?? '',
      careOf: map['careOf'] ?? '',
      street: map['street'] ?? '',
      district: map['district'] ?? '',
      name: map['name'] ?? '',
      postOfficeName: map['postOfficeName'] ?? '',
      vtcName: map['vtcName'] ?? '',
      photoBase64: map['photoBase64'] ?? '',
      state: map['state'] ?? '',
      landmark: map['landmark'] ?? '',
      responseMessage: map['responseMessage'] ?? '',
      subDistrict: map['subDistrict'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AadharvalidateResponse.fromJson(String source) =>
      AadharvalidateResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AadharvalidateResponse(pincode: $pincode, country: $country, gender: $gender, documentType: $documentType, xmlBase64: $xmlBase64, locality: $locality, mobile: $mobile, dateOfBirth: $dateOfBirth, maskAadhaarNumber: $maskAadhaarNumber, house: $house, referenceId: $referenceId, responseCode: $responseCode, careOf: $careOf, street: $street, district: $district, name: $name, postOfficeName: $postOfficeName, vtcName: $vtcName, photoBase64: $photoBase64, state: $state, landmark: $landmark, responseMessage: $responseMessage, subDistrict: $subDistrict, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AadharvalidateResponse &&
        other.pincode == pincode &&
        other.country == country &&
        other.gender == gender &&
        other.documentType == documentType &&
        other.xmlBase64 == xmlBase64 &&
        other.locality == locality &&
        other.mobile == mobile &&
        other.dateOfBirth == dateOfBirth &&
        other.maskAadhaarNumber == maskAadhaarNumber &&
        other.house == house &&
        other.referenceId == referenceId &&
        other.responseCode == responseCode &&
        other.careOf == careOf &&
        other.street == street &&
        other.district == district &&
        other.name == name &&
        other.postOfficeName == postOfficeName &&
        other.vtcName == vtcName &&
        other.photoBase64 == photoBase64 &&
        other.state == state &&
        other.landmark == landmark &&
        other.responseMessage == responseMessage &&
        other.subDistrict == subDistrict &&
        other.email == email;
  }

  @override
  int get hashCode {
    return pincode.hashCode ^
        country.hashCode ^
        gender.hashCode ^
        documentType.hashCode ^
        xmlBase64.hashCode ^
        locality.hashCode ^
        mobile.hashCode ^
        dateOfBirth.hashCode ^
        maskAadhaarNumber.hashCode ^
        house.hashCode ^
        referenceId.hashCode ^
        responseCode.hashCode ^
        careOf.hashCode ^
        street.hashCode ^
        district.hashCode ^
        name.hashCode ^
        postOfficeName.hashCode ^
        vtcName.hashCode ^
        photoBase64.hashCode ^
        state.hashCode ^
        landmark.hashCode ^
        responseMessage.hashCode ^
        subDistrict.hashCode ^
        email.hashCode;
  }
}
