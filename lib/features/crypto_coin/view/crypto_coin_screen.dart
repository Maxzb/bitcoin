import 'package:bitcoin/model/user.dart';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
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
