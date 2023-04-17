import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
        var res = await Future.wait([
          _apiService.getProductList('women'),
          _apiService.getProductList('men'),
          _apiService.getProductList('accessories'),
        ]);

        emit(ProductListSuccessState(res[0], res[1], res[2]));
      } catch (e) {
        emit(ProductListErrorState(e.toString()));
      }
    });
  }
}
