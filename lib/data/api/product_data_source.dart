import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data.dart';

part 'product_data_source.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/')
abstract class ProductDataSource {
  factory ProductDataSource(Dio dio, {String? baseUrl}) = _ProductDataSource;

  @GET('v1/products/')
  Future<List<ProductResponseModel>> getProducts();
}
