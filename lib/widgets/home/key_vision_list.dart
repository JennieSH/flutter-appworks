import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_appworks/data/key_vision.dart';

class KeyVisionList extends StatelessWidget {
  const KeyVisionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kvList
            .map(
              (kv) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    kv.url,
                    width: 300,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
