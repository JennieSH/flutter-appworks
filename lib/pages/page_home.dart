import 'package:flutter/material.dart';
import 'package:flutter_appworks/widgets/button_section.dart';
import 'package:flutter_appworks/widgets/text_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<Color> _colorList = [Colors.green, Colors.red, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
      ),
      // create InheritedWidgets
      // when color in TextColor change, all child Widget changed
      // now let's create a button for multiple color changing
      body: Center(
        child: TextColor(
          color: _colorList[_index % 3],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  // press button to change color in list
                  setState(() {
                    _index++;
                  });
                },
                icon: const Icon(Icons.loop),
                label: const Text('change color'),
              ),
              ButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
