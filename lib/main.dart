import 'package:driver_app/driver_main.dart';
import 'package:driver_app/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Driver App",
      home: drivermain(),
    );
  }
}
