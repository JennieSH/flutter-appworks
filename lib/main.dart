import 'package:flutter/material.dart';
import 'package:flutter_appworks/counter_cubit.dart';
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
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // 有使用 state 地方，透過 BlocBuilder builder fuc 的二個參數，可拿到新的 state
          BlocBuilder<CounterCubit, int>(
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
                  // context.read.<anyAction/anyEvent> 觸發 state 改變
                  context.read<CounterCubit>().increment();
                },
                icon: const Icon(Icons.add_circle),
                iconSize: 36,
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                icon: const Icon(Icons.remove_circle),
                iconSize: 36,
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterCubit>().reset();
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
