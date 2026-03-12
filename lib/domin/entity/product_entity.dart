import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  factory ProductEntity({
    required String title,
    required String description,
    required int price,
    required String image,
  }) = _ProductEntity;
}
