import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  final String title;
  AddressPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(title, style: TextStyle(fontSize: 12.0))]);
  }
}
