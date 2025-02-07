import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            color: Colors.white70,
          ),
        ),
      ),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('CryptoApp'),
        ),
        // leading: Icon(Icons.arrow_back),
      ),
      body: ListView.separated(
        itemCount: 23,
        separatorBuilder: (context, i) => Divider(
          color: Colors.white10,
        ),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin.svg',
            width: 35,
            height: 35,
          ),
          title: Text(
            'Bitcoin',
            style: theme.textTheme.titleMedium,
          ),
          subtitle: Text(
            'Test',
            style: theme.textTheme.titleSmall,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
