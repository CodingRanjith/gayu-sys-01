// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressData {
  final String? addressType;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? state;
  final String? cityDistrict;
  final String? area;
  final String? pincode;
  AddressData({
    this.addressType,
    this.address1,
    this.address2,
    this.address3,
    this.state,
    this.cityDistrict,
    this.area,
    this.pincode,
  });

  AddressData copyWith({
    String? addressType,
    String? address1,
    String? address2,
    String? address3,
    String? state,
    String? cityDistrict,
    String? area,
    String? pincode,
  }) {
    return AddressData(
      addressType: addressType ?? this.addressType,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      address3: address3 ?? this.address3,
      state: state ?? this.state,
      cityDistrict: cityDistrict ?? this.cityDistrict,
      area: area ?? this.area,
      pincode: pincode ?? this.pincode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addressType': addressType,
      'address1': address1,
      'address2': address2,
      'address3': address3,
      'state': state,
      'cityDistrict': cityDistrict,
      'area': area,
      'pincode': pincode,
    };
  }

  factory AddressData.fromMap(Map<String, dynamic> map) {
    return AddressData(
      addressType:
          map['addressType'] != null ? map['addressType'] as String : null,
      address1: map['address1'] != null ? map['address1'] as String : null,
      address2: map['address2'] != null ? map['address2'] as String : null,
      address3: map['address3'] != null ? map['address3'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      cityDistrict:
          map['cityDistrict'] != null ? map['cityDistrict'] as String : null,
      area: map['area'] != null ? map['area'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressData.fromJson(String source) =>
      AddressData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressData(addressType: $addressType, address1: $address1, address2: $address2, address3: $address3, state: $state, cityDistrict: $cityDistrict, area: $area, pincode: $pincode)';
  }

  @override
  bool operator ==(covariant AddressData other) {
    if (identical(this, other)) return true;

    return other.addressType == addressType &&
        other.address1 == address1 &&
        other.address2 == address2 &&
        other.address3 == address3 &&
        other.state == state &&
        other.cityDistrict == cityDistrict &&
        other.area == area &&
        other.pincode == pincode;
  }

  @override
  int get hashCode {
    return addressType.hashCode ^
        address1.hashCode ^
        address2.hashCode ^
        address3.hashCode ^
        state.hashCode ^
        cityDistrict.hashCode ^
        area.hashCode ^
        pincode.hashCode;
  }
}
