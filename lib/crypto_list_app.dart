import 'package:flutter/material.dart';

class CryptoListApp extends StatelessWidget {
  const CryptoListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        // Переопределяем встроенные MaterialUI стили
        // например может переопределить только цвет для titleMedium
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Center(
          child: Text('CryptoApp'),
        ),
        // leading: Icon(Icons.arrow_back),
      ),
      body: ListView.builder(
        itemCount: 23,
        itemBuilder: (context, i) => ListTile(
          title: Text(
            'Bitcoin',
            style: theme.textTheme.titleMedium,
          ),
          subtitle: Text(
            'Test',
            style: theme.textTheme.titleSmall,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
