import 'package:flutter/material.dart';
import 'package:flutter_appworks/widgets/logo.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
    );
  }
}
