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
        //toolbarHeight: 60.2,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(25),
        //       bottomLeft: Radius.circular(25)),
        // ),
        color: primary,
        elevation: 0.00),

        // textButtonTheme: const TextButtonThemeData(
        //   style: ButtonStyle(
        //     textStyle: ,
        //      primary: Colors.blue,
        //       onSurface: Colors.red,
        //   )
        // )
  );
}
