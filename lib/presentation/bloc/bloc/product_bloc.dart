import 'dart:async';
import 'package:api/core/core.dart';
import 'package:api/domin/domin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(ProductInitial()) {
    on<GetProduct>(getProductEvent);
  }

  FutureOr<void> getProductEvent(GetProduct event, Emitter<ProductState> emit)async {
    emit(GetProductLoading());
    ApiResult<List<ProductEntity>> result = await  productRepo.getProducts();
    result.when(success: (products) {
      emit(GetProductSuccess(products));
    }, failure: (errorMessage) {
      emit(GetProductFailure(errorMessage));
    });
  }
}
