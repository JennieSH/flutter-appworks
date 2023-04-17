import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/services/api.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    final ApiService _apiService = ApiService();

    on<GetProductEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        var product = await _apiService.getProductById(event.id);

        emit(ProductSuccessState(product));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
