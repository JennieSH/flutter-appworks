part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListLoadingState extends ProductListState {}

class ProductListSuccessState extends ProductListState {
  final List<Product> women;
  final List<Product> men;
  final List<Product> accessories;

  const ProductListSuccessState(this.women, this.men, this.accessories);
}

class ProductListErrorState extends ProductListState {
  final String? message;
  const ProductListErrorState(this.message);
}
