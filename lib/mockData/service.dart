import 'package:bitcoin/mockData/coins.dart';

class CoinsData {
  final List<Coin> coinsData;
  CoinsData(this.coinsData);
}

class Service {
  Future<CoinsData> getData() async {
    final coins = await _getCoinsData();
    return CoinsData(coins);
  }

  Future<List<Coin>> _getCoinsData() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Return mock coins data
    return coins;
  }
}
