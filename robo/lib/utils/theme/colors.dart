import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //background color
  //App background, base layer
  static const Color background = Color(0xFF121212); //jet black

  //Card / Container
  //Cards, modals, input boxes
  static const Color card = Color(0xFF1F1F1F); //charcoal grey

  //Primary Color
  //Primary buttons, links, active elements
  static const Color primary = Color(0xFF1E90FF); //electric blue

  //Accent color
  //Hover states, highlights, glowing effects
  static const Color accent = Color(0xFF00FF99); //neon green

  //Text - Main
  //Headings, key readable content
  static const Color textMain = Color(0xFFFFFFFF); //white

  //Text - Secondary
  //Descriptions, labels, subtitles
  static const Color textSecondary = Color(0xFFBBBBBB); //light grey

  //Text - Muted / Disabled
  //Disabled text, Hint text
  static const Color textMuted = Color(0xFF777777); //muted grey

  //Border / Divider
  //Dividers, borders, outlines
  static const Color border = Color(0xFF2C2C2C); //dark grey

  //Error/Alert
  //Error messages, alerts, critical notifications
  static const Color error = Color(0xFFEF4444); //bright red

  //Success
  //Success messages, confirmations
  static const Color success = Color(0xFF10B981); //soft green

  //Accent - alternating
  //Alternate accent for variety or glowing text
  static const Color accentAlt = Color(0xFF00FFFF); //Cyan
}
