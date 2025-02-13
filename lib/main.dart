import 'dart:io';
import 'package:bitcoin/routes/routes.dart';
import 'package:bitcoin/theme/theme.dart';
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
      theme: darkTheme,
      routes: routes,
      // Убираем home так как определили стартовый экран выше с помощью '/'
      // home: const CryptoListScreen(),

      // Можем указать стартовый экран вручную
      // initialRoute: '/coin',
    );
  }
}
