import 'dart:io';
import 'package:bitcoin/features/crypto_list/crypto_list.dart';
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

  runApp(const CryptoList());
}
