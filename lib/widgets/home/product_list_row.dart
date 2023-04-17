import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/home/product_item.dart';

class ProductListRow extends StatelessWidget {
  const ProductListRow({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories
          .map(
            (category) => Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // ScrollList
                  Expanded(
                    child: ListView.builder(
                      itemCount: category.products.length,
                      itemBuilder: (context, index) => ProductItem(
                        product: category.products[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
