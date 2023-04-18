import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Color {
  Color({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
  Map<String, dynamic> toJson() => _$ColorToJson(this);
}

@JsonSerializable()
class Variant {
  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  @JsonKey(name: 'color_code')
  String colorCode;
  String size;
  int stock;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

@JsonSerializable()
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
  @JsonKey(name: 'main_image')
  String mainImage;
  List<String> images;
  List<Variant> variants;
  List<Color> colors;
  List<String> sizes;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

class Category {
  Category({required this.name, required this.products});

  String name;
  List<Product> products;
}
