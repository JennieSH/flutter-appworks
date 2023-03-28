import 'key_vision_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appworks/data/key_vision.dart';
import 'package:flutter_appworks/data/product.dart';
import 'package:flutter_appworks/widgets/home/product_list_column.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout(
      {super.key, required this.kvList, required this.categories});

  final List<KeyVision> kvList;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KeyVisionList(kvList: kvList),
        Expanded(
          child: ProductListColumn(categories: categories),
        )
      ],
    );
  }
}
