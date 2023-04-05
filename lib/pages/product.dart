import 'package:flutter/material.dart';
import 'package:flutter_appworks/services/product.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/product/product_desktop_layout.dart';
import 'package:flutter_appworks/widgets/product/product_mobile_layout.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';

class ProductPage extends StatelessWidget {
  final String id;

  ProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final product = getProductById(id);

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
