part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class GetProductInitial extends ProductState {
  const GetProductInitial();
}

final class GetProductLoading extends ProductState {
  const GetProductLoading();
}

final class GetProductSuccess extends ProductState {
  final List<ProductEntity> products;
  const GetProductSuccess({required this.products});

  @override
  List<Object?> get props => [products];
}

final class GetProductError extends ProductState {
  final String message;
  const GetProductError({required this.message});

  @override
  List<Object?> get props => [message];
}
