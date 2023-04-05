import 'package:flutter/material.dart';
import 'package:flutter_appworks/widgets/gradient_text.dart';

class ProductInformation extends StatelessWidget {
  String story;
  List<String> images;

  ProductInformation({
    super.key,
    required this.story,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GradientText(
              '細部說明',
              style: const TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              gradient: LinearGradient(colors: [
                Colors.purple.shade900,
                Colors.blue.shade500,
                Colors.cyan.shade300,
              ]),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                indent: 24,
                color: Colors.grey[700],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          story,
          style: const TextStyle(
            height: 2,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ...images.map(
          (image) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Image.network(image),
          ),
        )
      ],
    );
  }
}
