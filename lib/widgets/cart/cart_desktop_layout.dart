import 'package:flutter/material.dart';
import 'package:flutter_appworks/constants/dimensions.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/widgets/cart/cart_product_item.dart';
import 'package:flutter_appworks/widgets/cart/location_and_payment_method_section.dart';
import 'package:flutter_appworks/widgets/cart/payment_form.dart';

class CartDesktopLayout extends StatelessWidget {
  CartDesktopLayout({super.key, required this.products});

  List<CartProduct> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(
            maxWidth: containerMaxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(flex: 5, child: Text('購物車(${products.length})')),
                    const Expanded(child: Text('數量')),
                    const Expanded(child: Text('單價')),
                    const Expanded(child: Text('小計')),
                    const SizedBox(width: 48)
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                ),
                child: Column(
                  children: products
                      .map((product) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CartProductItem(product: product),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              const LocationAndPaymentMethodSection(),
              const SizedBox(height: 24),
              const PaymentForm(),
            ],
          ),
        ),
      ),
    );
  }
}
