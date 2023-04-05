import 'package:flutter/material.dart';
import 'package:flutter_appworks/services/product.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/product/product_desktop_layout.dart';
import 'package:flutter_appworks/widgets/product/product_mobile_layout.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = getProductById('201807201824');

    return Scaffold(
        appBar: AppBar(
          title: const Logo(),
          centerTitle: true,
        ),
        body: ResponsiveLayout(
          mobileBody: ProductMobileLayout(product: product),
          desktopBody: ProductDesktopLayout(product: product),
        ));
  }
}
