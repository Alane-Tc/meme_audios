import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 155, 155, 18);

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    //Color
    primaryColor: primary,

    //AppbarTheme
    appBarTheme: const AppBarTheme(
        titleSpacing: 00.0,
        centerTitle: true,
        color: primary,
        elevation: 0.00),

      scaffoldBackgroundColor: const Color.fromARGB(255, 226, 226, 226)
  );
}
