import 'package:flutter/material.dart';
import 'package:newsee/routes/app_routes.dart';

class RouterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
