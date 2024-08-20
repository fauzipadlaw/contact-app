import 'package:contact_app/utils/colors.dart';
import 'package:contact_app/views/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}
