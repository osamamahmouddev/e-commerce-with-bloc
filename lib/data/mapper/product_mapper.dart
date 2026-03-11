import 'package:api/domin/domin.dart';

import '../data.dart';

ProductEntity mapProductResponseModelToEntity(ProductResponseModel model) {
  return ProductEntity(
    title: model.title ?? '',
    description: model.description ?? '',
    price: model.price ?? 0,
    image: model.images != null && model.images!.isNotEmpty
        ? model.images!.first
        : '',
  );
}
