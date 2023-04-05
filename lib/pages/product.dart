import 'package:flutter/material.dart';
import 'package:flutter_appworks/services/product.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/product/product_desktop_layout.dart';
import 'package:flutter_appworks/widgets/product/product_mobile_layout.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  late Map routeData = {};

  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute.of(context)?.settings.arguments as Map;
    final product = getProductById('${routeData['id']}');

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
