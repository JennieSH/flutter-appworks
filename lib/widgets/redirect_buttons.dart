import 'package:flutter/material.dart';

import 'package:flutter_appworks/pages/page_a.dart';
import 'package:flutter_appworks/pages/page_b.dart';
import 'package:flutter_appworks/widgets/text_color.dart';

class RedirectButtons extends StatefulWidget {
  const RedirectButtons({super.key});

  @override
  State<RedirectButtons> createState() => _RedirectButtonsState();
}

class _RedirectButtonsState extends State<RedirectButtons> {
  @override
  Widget build(BuildContext context) {
    // receive data from TextColor
    final _color = TextColor.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PageA(color: _color),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_color),
            ),
            child: const Text('Go Page A')),
        const SizedBox(width: 20),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_color),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PageB(color: _color),
                ),
              );
            },
            child: const Text('Go Page B'))
      ],
    );
  }
}
