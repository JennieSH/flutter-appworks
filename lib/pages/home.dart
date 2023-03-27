import 'package:flutter/material.dart';
import 'package:flutter_appworks/data/product.dart';
import 'package:flutter_appworks/widgets/home/key_vision_list.dart';
import 'package:flutter_appworks/widgets/home/product_list_desktop_layout.dart';
import 'package:flutter_appworks/widgets/home/product_list_mobile_layout.dart';
import 'package:flutter_appworks/widgets/home/product_responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [women, men, accessories];

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 120.0,
          child: Image.asset('assets/logo.png'),
        ),
      ),
      body: Column(children: [
        const KeyVisionList(),
        Expanded(
          child: ProductResponsiveLayout(
            mobileBody: ProductListMobileLayout(categories: categories),
            desktopBody: ProductListDesktopLayout(categories: categories),
          ),
        )
      ]),
    );
  }
}
