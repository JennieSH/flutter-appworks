import 'package:flutter/material.dart';
import 'package:flutter_appworks/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      // 使用 BlocProvider 注入
      home: BlocProvider<CounterBloc>(
        create: (_) => CounterBloc(),
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLoC'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // BlocBuilder<Bloc,State>
          BlocBuilder<CounterBloc, int>(
            builder: (context, count) => Text(
              '$count',
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
                  // 使用 add 傳送事件
                  counterBloc.add(IncrementEvent());
                },
                icon: const Icon(Icons.add_circle),
                iconSize: 36,
              ),
              IconButton(
                onPressed: () {
                  counterBloc.add(DecrementEvent());
                },
                icon: const Icon(Icons.remove_circle),
                iconSize: 36,
              ),
              IconButton(
                onPressed: () {
                  counterBloc.add(ResetEvent());
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
