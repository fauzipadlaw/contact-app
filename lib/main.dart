import 'package:contact_app/core/theme/colors.dart';
import 'package:contact_app/data/models/contact_model.dart';
import 'package:contact_app/presentation/widgets/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = "/assets/db";
  if (!kIsWeb) {
    var appDocDir = await getApplicationDocumentsDirectory();
    path = appDocDir.path;
  }

  Hive
    ..init(path)
    ..registerAdapter(ContactModelAdapter());

  await Hive.openBox<ContactModel>('contacts');
  runApp(const ProviderScope(child: MyApp()));
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
      home: const Navbar(),
    );
  }
}
