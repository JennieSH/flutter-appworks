import 'package:flutter/material.dart';
import 'package:flutter_appworks/cubit/product_selector_cubit.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/product/add_shopping_cart_button.dart';
import 'package:flutter_appworks/widgets/product/product_color_code.dart';
import 'package:flutter_appworks/widgets/product/product_quantity.dart';
import 'package:flutter_appworks/widgets/product/product_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductVariant extends StatelessWidget {
  Product product;

  ProductVariant({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${product.id}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'TWD. ${product.price}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          height: 32,
          thickness: 1,
          color: Colors.grey[300],
        ),
        ProductColorCode(product: product),
        const SizedBox(
          height: 24,
        ),
        ProductSize(product: product),
        const SizedBox(
          height: 24,
        ),
        const ProductQuantity(),
        BlocBuilder<ProductSelectorCubit, ProductSelectorState>(
          builder: (context, state) {
            return Visibility(
              visible: state.isAllSelected,
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Text(
                  '剩餘數量：${state.getAvailableStock}',
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        const AddShoppingCartButton(),
        const SizedBox(
          height: 24,
        ),
        Text(
          product.note,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          product.texture,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          product.description,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          product.texture,
          style: const TextStyle(height: 1.5),
        ),
        Text(
          '加工產地/${product.place}',
          style: const TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
