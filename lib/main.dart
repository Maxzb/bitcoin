import 'dart:io';
import 'package:bitcoin/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  if (Platform.isLinux || Platform.isAndroid) {
    debugPrint = (String? message, {int? wrapWidth}) {
      // Игнорируем сообщения, содержащие "MESA"
      if (message != null && !message.contains("I/MESA")) {
        // ignore: avoid_print
        print(message);
      }
    };
  }

  runApp(const CryptoListApp());
}

class CryptoListApp extends StatelessWidget {
  const CryptoListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoApp',
      theme: ThemeData(
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
      ),
      routes: routes,
      // Убираем home так как определили стартовый экран выше с помощью '/'
      // home: const CryptoListScreen(),

      // Можем указать стартовый экран вручную
      // initialRoute: '/coin',
    );
  }
}
