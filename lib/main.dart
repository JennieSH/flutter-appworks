import 'package:flutter/material.dart';
import 'package:flutter_appworks/pages/home.dart';
import 'package:flutter_appworks/pages/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansTC',
        primarySwatch: Colors.grey,
        dividerColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
        ),
      ),
      routes: {
        '/': (context) => HomePage(),
        '/product': (context) => ProductPage()
      },
    );
  }
}
