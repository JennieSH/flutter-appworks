import 'package:flutter_appworks/models/campaign.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/services/campaign.dart';
import 'package:flutter_appworks/services/product.dart';

class ApiService {
  final CampaignService _campaignService = CampaignService();
  final ProductService _productService = ProductService();

  Future<List<Campaign>> getCampaignList() =>
      _campaignService.getCampaignList();

  Future<List<Product>> getProductList(String category) =>
      _productService.getProductList(category);

  Future<Product> getProductById(int id) => _productService.getProductById(id);
}
