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
  final List<Campaign> campaigns;

  const ProductListSuccessState(
    this.women,
    this.men,
    this.accessories,
    this.campaigns,
  );
}

class ProductListErrorState extends ProductListState {
  final String? message;
  const ProductListErrorState(this.message);
}
