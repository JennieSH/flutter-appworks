import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MethodChannel(),
    );
  }
}

class MethodChannel extends StatelessWidget {
  MethodChannel({super.key});
  String _greeting = '';

  Future<void> _getGreeting() async {
    var platform = MethodChannel('flutter_appworks_channel');
    try {
      _greeting = await platform.invokeMethod('getAndroidString');
    } on PlatformException catch (e) {
      print(e.message);
    }
    print(_greeting);
  }

  @override
  Widget build(BuildContext context) {
    _getGreeting();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MethodChannel'),
      ),
    );
  }
}
