// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Color _$ColorFromJson(Map<String, dynamic> json) => Color(
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      colorCode: json['color_code'] as String,
      size: json['size'] as String,
      stock: json['stock'] as int,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'color_code': instance.colorCode,
      'size': instance.size,
      'stock': instance.stock,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      texture: json['texture'] as String,
      wash: json['wash'] as String,
      place: json['place'] as String,
      note: json['note'] as String,
      story: json['story'] as String,
      mainImage: json['main_image'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      colors: (json['colors'] as List<dynamic>)
          .map((e) => Color.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'texture': instance.texture,
      'wash': instance.wash,
      'place': instance.place,
      'note': instance.note,
      'story': instance.story,
      'main_image': instance.mainImage,
      'images': instance.images,
      'variants': instance.variants,
      'colors': instance.colors,
      'sizes': instance.sizes,
    };
