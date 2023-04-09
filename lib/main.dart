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
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // a. wrap with StreamBuilder
          StreamBuilder(
            stream:
                counterBloc.counterStream, // b. use builder and return widget
            initialData: 0, // c. 不給 init data，一開始會拿到 null
            builder: (context, snapshot) => Text(
              '${snapshot.data}', // d. snapshot.data 得到值
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.INCREMENT);
                },
                icon: const Icon(Icons.add_circle),
                iconSize: 36,
              ),
              IconButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.DECREMENT);
                },
                icon: const Icon(Icons.remove_circle),
                iconSize: 36,
              ),
              IconButton(
                onPressed: () {
                  counterBloc.eventSink.add(CounterAction.RESET);
                },
                icon: const Icon(Icons.loop_outlined),
                iconSize: 36,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
