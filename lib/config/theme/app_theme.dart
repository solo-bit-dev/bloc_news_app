import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      useMaterial3: true,
      fontFamily: 'IBMPlexSans',
      appBarTheme: _appBarTheme(),
    );

AppBarTheme _appBarTheme() => const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
