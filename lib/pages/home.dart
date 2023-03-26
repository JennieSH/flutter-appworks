import 'package:flutter/material.dart';
import 'package:flutter_appworks/widgets/home/key_vision_list.dart';
import 'package:flutter_appworks/widgets/home/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset('assets/logo.png'),
          width: 120.0,
        ),
      ),
      body: Column(children: [
        const KeyVisionList(),
        Expanded(
          child: ListView(
            children: const [
              ProductList(title: '女裝'),
              ProductList(title: '男裝'),
              ProductList(title: '配件')
            ],
          ),
        )
      ]),
    );
  }
}
