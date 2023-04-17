part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final Product product;

  const ProductSuccessState(this.product);
}

class ProductErrorState extends ProductState {
  final String? message;
  const ProductErrorState(this.message);
}
