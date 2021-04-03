import 'package:challenge/config/state/index.dart';
import 'package:challenge/providers/coins_provider.dart';
import 'package:challenge/routes.dart';
import 'package:challenge/services/my_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MyState>(
      create: (context) => MyState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    MyPreferences.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CoinProvider>(
      lazy: false,
      create: (_) => CoinProvider(),
      child: MaterialApp(
        title: 'Flutter Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            tabBarTheme: TabBarTheme(
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                ))),
        routes: appRoutes,
        initialRoute: "/",
      ),
    );
  }
}