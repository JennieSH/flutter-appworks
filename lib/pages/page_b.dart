import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  const PageB({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: Text(
          "This is Page B",
          textScaleFactor: 2,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
