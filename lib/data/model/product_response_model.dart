import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_response_model.freezed.dart';
part 'product_response_model.g.dart';

@freezed
abstract class ProductResponseModel with _$ProductResponseModel {
  const factory ProductResponseModel({
    int? id,
    String? title,
    String? slug,
    int? price,
    String? description,
    Category? category,
    List<String>? images,
    String? creationAt,
    String? updatedAt,
  }) = _ProductResponseModel;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    int? id,
    String? name,
    String? slug,
    String? image,
    String? creationAt,
    String? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
