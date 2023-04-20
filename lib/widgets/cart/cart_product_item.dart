import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/cart/product_info_card.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    required this.product,
  });

  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 5, child: ProductInfoCard(product: product)),
        Expanded(child: Text(product.selectedQuantity.toString())),
        Expanded(child: Text(product.price.toString())),
        Expanded(child: Text('${product.price * product.selectedQuantity}')),
        IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outlined))
      ],
    );
  }
}
