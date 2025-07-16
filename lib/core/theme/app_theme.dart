import 'package:flutter/material.dart';
import 'package:supabase_studying/core/theme/app_color.dart';

class AppTheme {
  static _border([Color color = AppColor.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: color),
      borderRadius: BorderRadius.circular(10));
  static final themeDark = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(color: AppColor.backgroundColor),
      scaffoldBackgroundColor: AppColor.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: _border(),
          focusedBorder: _border(AppColor.gradient2)));
}
