import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: {'id': product.id});
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              // 解決圖片左邊會溢出 container padding 問題
              // TODO: 尋找是否有更佳解，e.g. container overflow: hidden
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
              child: Image.network(
                product.mainImage,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                const SizedBox(
                  height: 8,
                ),
                Text('NT\$ ${product.price}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
