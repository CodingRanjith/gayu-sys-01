// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoanType {
  final String? typeOfLoan;
  LoanType({this.typeOfLoan});

  LoanType copyWith({String? typeOfLoan}) {
    return LoanType(typeOfLoan: typeOfLoan ?? this.typeOfLoan);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'typeOfLoan': typeOfLoan};
  }

  factory LoanType.fromMap(Map<String, dynamic> map) {
    return LoanType(
      typeOfLoan:
          map['typeOfLoan'] != null ? map['typeOfLoan'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanType.fromJson(String source) =>
      LoanType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoanType(typeOfLoan: $typeOfLoan)';

  @override
  bool operator ==(covariant LoanType other) {
    if (identical(this, other)) return true;

    return other.typeOfLoan == typeOfLoan;
  }

  @override
  int get hashCode => typeOfLoan.hashCode;
}
