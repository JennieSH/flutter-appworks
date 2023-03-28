import 'package:flutter/material.dart';
import 'package:flutter_appworks/data/product.dart';
import 'package:flutter_appworks/widgets/home/product_item.dart';

class ProductListColumn extends StatelessWidget {
  const ProductListColumn({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categories[index].name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: categories[index]
                .products
                .map(
                  (product) => ProductItem(
                    product: product,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
