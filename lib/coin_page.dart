import 'package:bitcoin/data/user.dart';
import 'package:flutter/material.dart';

class CryptoCoinApp extends StatefulWidget {
  const CryptoCoinApp({super.key});

  @override
  State<CryptoCoinApp> createState() => _CryptoCoinAppState();
}

class _CryptoCoinAppState extends State<CryptoCoinApp> {
  @override
  Widget build(BuildContext context) {
    // 1. С mockData
    // final Coin coin = ModalRoute.of(context)?.settings.arguments as Coin;
    // 2. С данными с сайта jsonplaceholder.typicode.com
    final User user = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        // 1. С mockData
        // title: Text(coin.title),
        // 2. С данными с сайта jsonplaceholder.typicode.com
        title: Text(user.name),
      ),
    );
  }
}
