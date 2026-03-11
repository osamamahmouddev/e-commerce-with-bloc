part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductLoading extends ProductState {}

final class GetProductFailure extends ProductState {
  final String errorMessage;

  GetProductFailure(this.errorMessage);
}

final class GetProductSuccess extends ProductState {
  final List<ProductEntity> products;

  GetProductSuccess(this.products);
}
