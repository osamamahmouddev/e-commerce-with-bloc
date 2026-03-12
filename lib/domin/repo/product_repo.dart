import 'package:fpdart/fpdart.dart';

import '../domin.dart';

abstract class ProductRepo {
  Future<Either<List<ProductEntity>, String>> getProducts();
}
