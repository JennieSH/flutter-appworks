import 'package:flutter/material.dart';

// extend InheritedWidget
class TextColor extends InheritedWidget {
  TextColor({
    super.key,
    required super.child,
    required this.color,
  });

  Color? color;

  // return text color to widget
  static Color of(BuildContext context) {
    final Color? textColor =
        context.dependOnInheritedWidgetOfExactType<TextColor>()!.color;

    return textColor!;
  }

// this will notify all child widgets when there is a changes
  @override
  bool updateShouldNotify(TextColor oldWidget) {
    return color != oldWidget.color;
  }
}
