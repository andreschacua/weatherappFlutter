import 'package:flutter/material.dart';

class Constants {
  final primaryColor = const Color(0xFF1E88E5);
  final secondaryColor = const Color(0xFF64B5F6);
  final tertiaryColor = const Color(0xFF0D47A1);
  final blackColor = const Color(0xFF1A237E);

  final greyColor = const Color(0xFFBBDEFB);

  final Shader shader = const LinearGradient(
    colors: [Color(0xFF1E88E5), Color(0xFF64B5F6)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final linearGradientBlue = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xFF1E88E5), Color(0xFF64B5F6)],
      stops: [0.0, 1.0]);

  final linearGradientPurple = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xFF0D47A1), Color(0xFF64B5F6)],
      stops: [0.0, 1.0]);
}