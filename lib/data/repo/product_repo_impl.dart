import 'package:api/core/core.dart';
import 'package:api/domin/domin.dart';

import '../data.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductDataSource restClient;

  ProductRepoImpl({required this.restClient});

  @override
  Future<ApiResult<List<ProductEntity>>> getProducts() async {
    try {
      final response = await restClient.getProducts();
      final products = response.map(mapProductResponseModelToEntity).toList();
      return ApiResult.success(products);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
