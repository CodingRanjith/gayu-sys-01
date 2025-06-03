import 'package:equatable/equatable.dart';

class Lead extends Equatable {
  final String name;
  final String leadId;
  final DateTime createdDate;
  final String phone;
  final String loanAmount;
  final String address;
  Lead({
    required this.name,
    required this.leadId,
    required this.createdDate,
    required this.phone,
    required this.address,
    required this.loanAmount,
  });

  @override
  List<Object?> get props => [
    name,
    leadId,
    createdDate,
    phone,
    address,
    loanAmount,
  ];
}
