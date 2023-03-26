import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class KeyVisionList extends StatelessWidget {
  const KeyVisionList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> urlList = List.filled(5,
        'https://images.unsplash.com/photo-1523496922380-91d5afba98a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...urlList.map(
            (url) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  url,
                  width: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
