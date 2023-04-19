import 'package:flutter/material.dart';
import 'package:flutter_appworks/router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'NotoSansTC',
        primarySwatch: Colors.grey,
        dividerColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
        ),
      ),
      routeInformationParser: AppRouter().router.routeInformationParser,
      routerDelegate: AppRouter().router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
