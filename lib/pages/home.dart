import 'package:flutter/material.dart';
import 'package:flutter_appworks/data/product.dart';
import 'package:flutter_appworks/widgets/home/key_vision_list.dart';
import 'package:flutter_appworks/widgets/home/product_list_column.dart';
import 'package:flutter_appworks/widgets/home/product_list_row.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [women, men, accessories];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            width: 120.0,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
      body: Column(children: [
        const KeyVisionList(),
        Expanded(
          child: ResponsiveLayout(
            mobileBody: ProductListColumn(categories: categories),
            desktopBody: ProductListRow(categories: categories),
          ),
        )
      ]),
    );
  }
}
