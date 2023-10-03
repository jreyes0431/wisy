import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisy_photo_app/common/customs.dart';
import 'ui/views/views.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.capriolaTextTheme(
          Theme.of(context).textTheme,
        ),
        colorSchemeSeed: CustomColor.primaryRed,
      ),
      home: const LoginPage(),
    );
  }
}
