import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryRed = Color(0xFFA6382E);
  static const Color primaryRose = Color(0xFFD9958F);
  static const Color primaryBlue = Color(0xFF18298C);
  static const Color lightPurple = Color(0xFF3B3273);
  static const Color deepPurple = Color(0xFF201740);
}

class CustomParagraphStyle {
  static const TextStyle _base = TextStyle(
    fontWeight: FontWeight.w400,
    color: CustomColor.deepPurple,
    fontSize: 16,
  );

  static TextStyle regular = _base;
  static TextStyle small = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
  static TextStyle disclaimer = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    color: Colors.grey,
  );
}

class CustomTitleStyle {
  static const TextStyle _base = TextStyle(
    fontWeight: FontWeight.w600,
    color: CustomColor.deepPurple,
    fontSize: 24,
  );

  static TextStyle regular = _base;
  static TextStyle grandTitle = _base.copyWith(fontSize: 32);

  static TextStyle xxLarge = _base.copyWith(
    fontSize: 64,
    fontWeight: FontWeight.w800,
  );
}
