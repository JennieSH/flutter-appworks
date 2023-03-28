import 'package:flutter_appworks/models/product.dart';

List<Product> getMenProducts() {
  return List.filled(
      5,
      Product(
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
        mainImage:
            'https://api.appworks-school.tw/assets/201807201824/main.jpg',
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
      ));
}

List<Product> getWomenProducts() {
  return List.filled(
    5,
    Product(
      id: 201807242211,
      category: 'men',
      title: '純色輕薄百搭襯衫',
      description: '厚薄：薄\r\n彈性：無',
      price: 799,
      texture: '棉 100%',
      wash: '手洗，溫水',
      place: '中國',
      note: '實品顏色依單品照為主',
      story:
          'O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.',
      mainImage: 'https://api.appworks-school.tw/assets/201807242211/main.jpg',
      images: [
        'https://api.appworks-school.tw/assets/201807242211/0.jpg',
        'https://api.appworks-school.tw/assets/201807242211/1.jpg',
        'https://api.appworks-school.tw/assets/201807242211/0.jpg',
        'https://api.appworks-school.tw/assets/201807242211/1.jpg',
      ],
      variants: [
        Variant(
          colorCode: 'FFFFFF',
          size: 'M',
          stock: 5,
        ),
        Variant(
          colorCode: 'FFFFFF',
          size: 'L',
          stock: 7,
        ),
        Variant(
          colorCode: 'FFFFFF',
          size: 'XL',
          stock: 1,
        ),
        Variant(
          colorCode: 'DDF0FF',
          size: 'M',
          stock: 1,
        ),
        Variant(
          colorCode: 'DDF0FF',
          size: 'L',
          stock: 4,
        ),
        Variant(
          colorCode: 'DDF0FF',
          size: 'XL',
          stock: 3,
        ),
      ],
      colors: [
        Color(
          code: 'FFFFFF',
          name: '白色',
        ),
        Color(
          code: 'DDF0FF',
          name: '淺藍',
        ),
      ],
      sizes: ['M', 'L', 'XL'],
    ),
  );
}

List<Product> getAccessoriesProducts() {
  return List.filled(
      5,
      Product(
        id: 201807242228,
        category: 'accessories',
        title: '夏日海灘戶外遮陽帽',
        description: '厚薄：薄\r\n彈性：無',
        price: 1499,
        texture: '棉 100%',
        wash: '手洗，溫水',
        place: '中國',
        note: '實品顏色依單品照為主',
        story:
            'O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey, making it even lighter for those who prefer their summer style extra-breezy.',
        mainImage:
            'https://api.appworks-school.tw/assets/201807242228/main.jpg',
        images: [
          'https://api.appworks-school.tw/assets/201807242228/0.jpg',
          'https://api.appworks-school.tw/assets/201807242228/1.jpg',
          'https://api.appworks-school.tw/assets/201807242228/0.jpg',
          'https://api.appworks-school.tw/assets/201807242228/1.jpg',
        ],
        variants: [
          Variant(
            colorCode: 'DDF0FF',
            size: 'M',
            stock: 7,
          ),
          Variant(
            colorCode: 'DDF0FF',
            size: 'L',
            stock: 1,
          ),
          Variant(
            colorCode: 'BB7744',
            size: 'M',
            stock: 3,
          ),
          Variant(
            colorCode: 'BB7744',
            size: 'L',
            stock: 1,
          ),
        ],
        colors: [
          Color(
            code: 'DDF0FF',
            name: '淺藍',
          ),
          Color(
            code: 'BB7744',
            name: '淺棕',
          ),
        ],
        sizes: ['M', 'L'],
      ));
}

// TODO 待整理
Category women = Category(name: '女裝', products: getMenProducts());
Category men = Category(name: '男裝', products: getWomenProducts());
Category accessories = Category(name: '配件', products: getAccessoriesProducts());
