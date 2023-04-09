import 'package:flutter/material.dart';
import 'package:flutter_appworks/counter_bloc.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: Counter());
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  // STEP 1. 宣告 counterBloc
  final counterBloc = CounterBloc();

  void _incrementCounter() {
    _counter++;
    // STEP 2. 使用 counterSink.add(data)
    counterBloc.counterSink.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // STEP 3. 監聽 stream
          // a. wrap with StreamBuilder
          StreamBuilder(
            stream:
                counterBloc.counterStream, // b. use builder and return widget
            builder: (context, snapshot) => Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          IconButton(
            onPressed: _incrementCounter,
            icon: const Icon(Icons.add_circle),
            iconSize: 36,
          )
        ]),
      ),
    );
  }
}
