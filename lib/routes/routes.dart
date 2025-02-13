import 'package:bitcoin/features/crypto_coin/view/view.dart';
import 'package:bitcoin/features/crypto_list/view/view.dart';

final routes = {
  '/': (context) => CryptoListScreen(),
  '/coin': (context) => CryptoCoinScreen()
};
