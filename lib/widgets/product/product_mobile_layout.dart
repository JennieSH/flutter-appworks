import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/product/product_variant.dart';
import 'product_information.dart';

class ProductMobileLayout extends StatelessWidget {
  Product product;

  ProductMobileLayout({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 32,
        ),
        child: Column(
          children: [
            Image.network(product.mainImage),
            const SizedBox(
              height: 24,
            ),
            ProductVariant(product: product),
            const SizedBox(
              height: 24,
            ),
            ProductInformation(
              story: product.story,
              images: product.images,
            )
          ],
        ),
      ),
    );
  }
}
