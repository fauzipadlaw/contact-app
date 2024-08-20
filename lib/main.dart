import 'package:contact_app/utils/colors.dart';
import 'package:contact_app/views/components/navbar.dart';
import 'package:contact_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ThemeData().colorScheme.copyWith(primary: blue),
        useMaterial3: true,
      ),
      home: Navbar(),
    );
  }
}
