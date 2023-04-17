import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/services/product.dart';

import './config.dart';

class ApiService {
  final _dio = dio;
  final ProductService _productService = ProductService();

  Future<List<Product>> getProductList(String category) =>
      _productService.getProductList(category);

  Future<Product> getProductById(int id) => _productService.getProductById(id);
}
