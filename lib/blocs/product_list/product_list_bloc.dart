import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appworks/models/campaign.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/services/api.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListLoadingState()) {
    final ApiService _apiService = ApiService();

    on<GetProductListEvent>((event, emit) async {
      emit(ProductListLoadingState());

      try {
        final res = await Future.wait([
          _apiService.getProductList('women'),
          _apiService.getProductList('men'),
          _apiService.getProductList('accessories'),
          _apiService.getCampaignList()
        ]);

        // List.cast() 方法將 List<Object> 轉換為 List<Product>
        emit(ProductListSuccessState(
          res[0].cast<Product>(),
          res[1].cast<Product>(),
          res[2].cast<Product>(),
          res[3].cast<Campaign>(),
        ));
      } catch (e) {
        emit(ProductListErrorState(e.toString()));
      }
    });
  }
}
