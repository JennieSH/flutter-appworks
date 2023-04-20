import 'package:flutter/material.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/services/product.dart';
import 'package:flutter_appworks/widgets/cart/cart_desktop_layout.dart';
import 'package:flutter_appworks/widgets/logo.dart';
import 'package:flutter_appworks/widgets/responsive_layout.dart';

CartProduct mockCartProduct = CartProduct(
  id: 201807201824,
  category: 'women',
  title: '前開衩扭結洋裝',
  description: '厚薄：薄\r\n彈性：無',
  price: 799,
  texture: '棉 100%',
  wash: '手洗，溫水',
  place: '中國',
  note: '實品顏色依單品照為主',
  story:
      'O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.',
  mainImage: 'https://api.appworks-school.tw/assets/201807201824/main.jpg',
  images: [
    'https://api.appworks-school.tw/assets/201807201824/0.jpg',
    'https://api.appworks-school.tw/assets/201807201824/1.jpg',
    'https://api.appworks-school.tw/assets/201807201824/0.jpg',
    'https://api.appworks-school.tw/assets/201807201824/1.jpg',
  ],
  variants: [
    Variant(
      colorCode: 'FFFFFF',
      size: 'S',
      stock: 2,
    ),
    Variant(
      colorCode: 'FFFFFF',
      size: 'M',
      stock: 1,
    ),
    Variant(
      colorCode: 'FFFFFF',
      size: 'L',
      stock: 2,
    ),
    Variant(
      colorCode: 'DDFFBB',
      size: 'S',
      stock: 9,
    ),
    Variant(
      colorCode: 'DDFFBB',
      size: 'M',
      stock: 0,
    ),
    Variant(
      colorCode: 'DDFFBB',
      size: 'L',
      stock: 5,
    ),
    Variant(
      colorCode: 'CCCCCC',
      size: 'S',
      stock: 8,
    ),
    Variant(
      colorCode: 'CCCCCC',
      size: 'M',
      stock: 5,
    ),
    Variant(
      colorCode: 'CCCCCC',
      size: 'L',
      stock: 9,
    ),
  ],
  colors: [
    Color(
      code: 'FFFFFF',
      name: '白色',
    ),
    Color(
      code: 'DDFFBB',
      name: '亮綠',
    ),
    Color(
      code: 'CCCCCC',
      name: '淺灰',
    ),
  ],
  sizes: ['S', 'M', 'L'],
  selectedSize: 'S',
  selectedColor: Color(
    code: 'FFFFFF',
    name: '白色',
  ),
  selectedQuantity: 1,
);

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({super.key});

  final List<CartProduct> _products = [mockCartProduct, mockCartProduct];

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "購物車｜STYLiSH",
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(
          title: const Logo(),
        ),
        body: ResponsiveLayout(
          mobileBody: CartDesktopLayout(products: _products),
          desktopBody: CartDesktopLayout(products: _products),
        ),
      ),
    );
  }
}
