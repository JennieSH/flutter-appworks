import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_appworks/models/product.dart';
import 'package:flutter_appworks/services/product.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListLoadingState()) {
    on<GetProductListEvent>((event, emit) {
      emit(ProductListLoadingState());

      var women = getWomenProducts();
      var men = getMenProducts();
      var accessories = getAccessoriesProducts();

      emit(ProductListSuccessState(women, men, accessories));
    });
  }
}
