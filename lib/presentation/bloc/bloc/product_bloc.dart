import 'dart:async';
import 'package:api/domin/domin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(const GetProductInitial()) {
    on<GetProduct>(getProductEvent);
  }

  FutureOr<void> getProductEvent(
    GetProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(const GetProductLoading());
    Either<List<ProductEntity>, String> result = await productRepo
        .getProducts();
    result.fold(
      (products) {
        emit(GetProductSuccess(products: products));
      },
      (errorMessage) {
        emit(GetProductError(message: errorMessage));
      },
    );
  }
}
