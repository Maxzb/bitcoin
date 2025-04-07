import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
  ),
  scaffoldBackgroundColor: Colors.blueGrey,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
  listTileTheme: ListTileThemeData(iconColor: Colors.white70),
  useMaterial3: true,
  // Переопределяем встроенные MaterialUI стили
  // например может переопределить только цвет для titleMedium
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      color: Colors.white70,
    ),
    bodySmall: TextStyle(
      color: Colors.white70,
    ),
  ),
);
