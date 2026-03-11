part of 'product_bloc.dart';

sealed class ProductEvent {}

final class ProductStarted extends ProductEvent {}

final class GetProduct extends ProductEvent {}
