import 'package:api/core/core.dart';
import 'package:api/domin/domin.dart';
import 'package:fpdart/fpdart.dart';

import '../data.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductDataSource restClient;

  ProductRepoImpl({required this.restClient});

  @override
  Future<Either<List<ProductEntity>, String>> getProducts() async {
    try {
      final response = await restClient.getProducts();
      final products = response.map(mapProductResponseModelToEntity).toList();
      return Left(products);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
