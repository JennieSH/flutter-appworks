// TODO: 目前使用套件 fromJson 不會成功，待查，目前先用原生寫法
// import 'package:json_annotation/json_annotation.dart';
// part 'product.g.dart';

class Color {
  Color({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(code: json['code'], name: json['name']);
  }
}

class Variant {
  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  String colorCode;
  String size;
  int stock;

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}

class Product {
  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.mainImage,
    required this.images,
    required this.variants,
    required this.colors,
    required this.sizes,
  });

  int id;
  String category;
  String title;
  String description;
  int price;
  String texture;
  String wash;
  String place;
  String note;
  String story;
  String mainImage;
  List<String> images;
  List<Variant> variants;
  List<Color> colors;
  List<String> sizes;

  factory Product.fromJson(Map<String, dynamic> json) {
    final List<Color> colors = (json['colors'] as List)
        .map((colorJson) => Color.fromJson(colorJson))
        .toList();

    final List<Variant> variants = (json['variants'] as List)
        .map((variantJson) => Variant.fromJson(variantJson))
        .toList();

    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      colors: colors,
      sizes: List<String>.from(json['sizes']),
      variants: variants,
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
    );
  }
}

class Category {
  Category({required this.name, required this.products});

  String name;
  List<Product> products;
}
