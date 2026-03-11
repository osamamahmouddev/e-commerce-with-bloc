import 'package:api/core/core.dart';

import '../domin.dart';

abstract class ProductRepo {
  Future<ApiResult<List<ProductEntity>>> getProducts();
}
