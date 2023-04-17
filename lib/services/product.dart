import './config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appworks/constants/api_path.dart';
import 'package:flutter_appworks/models/product.dart';

class ProductService {
  final _dio = dio;

  Future<List<Product>> getProductList(String category) async {
    try {
      Response response = await _dio.get('${apiPath['product']}/$category');

      final List<dynamic> _data = response.data['data'];
      List<Product> _products =
          _data.map((json) => Product.fromJson(json)).toList();

      return _products;
    } catch (error) {
      print('getProductList error $error');
      rethrow;
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      Response response = await _dio
          .get(apiPath['product-details']!, queryParameters: {'id': id});

      return Product.fromJson(response.data['data']);
    } catch (error) {
      print('getProductById error $error');
      rethrow;
    }
  }
}
