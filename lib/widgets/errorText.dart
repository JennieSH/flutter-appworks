import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'ERROR :(',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(text)
        ],
      ),
    );
  }
}
