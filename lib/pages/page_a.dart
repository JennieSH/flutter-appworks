import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  const PageA({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page A'),
      ),
      body: Center(
        child: Text(
          "This is Page A",
          textScaleFactor: 2,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
