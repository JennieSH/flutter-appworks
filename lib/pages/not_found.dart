import 'package:flutter/material.dart';
import 'package:flutter_appworks/widgets/logo.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'ERROR  404',
              style: TextStyle(fontSize: 40, letterSpacing: 2),
            ),
            Text(
              'Page Not Found',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
