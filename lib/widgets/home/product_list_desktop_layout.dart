import 'package:flutter/material.dart';
import 'package:flutter_appworks/data/product.dart';
import 'package:flutter_appworks/widgets/home/product_item.dart';

class ProductListDesktopLayout extends StatelessWidget {
  const ProductListDesktopLayout({
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
                      itemBuilder: (context, index) => Column(
                        children: category.products
                            .map(
                              (product) => ProductItem(
                                product: product,
                              ),
                            )
                            .toList(),
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
