import 'package:bitcoin/data/user.dart';
import 'package:bitcoin/mockData/coins.dart';
import 'package:bitcoin/mockData/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:convert'; // Для работы с JSON
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    // Если запрос успешен, преобразуем JSON в список объектов User
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    // Если запрос не удался, выбрасываем исключение
    throw Exception('Не удалось загрузить данные');
  }
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
      routes: {
        '/': (context) => CryptoListScreen(),
        '/coin': (context) => CryptoCoinApp()
      },
      // Убираем home так как определили стартовый экран выше с помощью '/'
      // home: const CryptoListScreen(),

      // Можем указать стартовый экран вручную
      // initialRoute: '/coin',
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final mockService = Service();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('CryptoApp'),
        ),
        // leading: Icon(Icons.arrow_back),
      ),

      // 1. С mockData
      // body: FutureBuilder(
      //   future: mockService.getData(),
      //   builder: (context, AsyncSnapshot<CoinsData> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return ListView.separated(
      //         itemCount: coins.length,
      //         separatorBuilder: (context, indx) => Divider(
      //           color: Colors.white10,
      //         ),
      //         itemBuilder: (context, indx) {
      //           // const coinName = 'Bitcoin';

      //           return ListTile(
      //             leading: SvgPicture.asset(
      //               'assets/svg/bitcoin.svg',
      //               width: 35,
      //               height: 35,
      //             ),
      //             title: Text(
      //               coins[indx].title,
      //               style: theme.textTheme.titleMedium,
      //             ),
      //             subtitle: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   coins[indx].subTitle,
      //                   style: theme.textTheme.titleSmall,
      //                 ),
      //                 Text(
      //                   coins[indx].description,
      //                   style: theme.textTheme.bodySmall,
      //                 ),
      //               ],
      //             ),
      //             trailing: Icon(Icons.arrow_forward_ios),
      //             onTap: () {
      //               Navigator.of(context).pushNamed(
      //                 '/coin',
      //                 arguments: coins[indx],
      //               );
      //             },
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),

      // 2. С данными с сайта jsonplaceholder.typicode.com
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<User> users = snapshot.data!;

            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, indx) => Divider(
                color: Colors.white10,
              ),
              itemBuilder: (context, indx) {
                User user = users[indx];

                return ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/bitcoin.svg',
                    width: 35,
                    height: 35,
                  ),
                  title: Text(
                    user.name,
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.username,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        user.email,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/coin',
                      arguments: users[indx],
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

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
