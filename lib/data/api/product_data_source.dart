import 'package:api/core/network/api_consumer.dart';

import '../data.dart';

class ProductDataSource {
  final ApiConsumer apiConsumer;

  ProductDataSource({required this.apiConsumer});
  Future<List<ProductResponseModel>> getProducts() async {
    final response = await apiConsumer.get(path: 'v1/products/') as List;
    return response
        .map((e) => ProductResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
