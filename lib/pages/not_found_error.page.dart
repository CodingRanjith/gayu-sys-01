import 'package:flutter/material.dart';

class NotFoundErrorPage extends StatelessWidget {
  const NotFoundErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Page Not Found", style: TextStyle(fontSize: 24))],
        ),
      ),
    );
  }
}
