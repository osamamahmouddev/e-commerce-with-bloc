import 'package:api/domin/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../presentation.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return switch (state) {
          GetProductInitial() || GetProductLoading() => Skeletonizer(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 7,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: ProductEntity(
                    title: "data loading",
                    description: "data loading",
                    price: 0,
                    image: "",
                  ),
                );
              },
            ),
          ),
          GetProductError(:final message) => ErrorView(
            message: message,
            onRetry: () => context.read<ProductBloc>().add(GetProduct()),
          ),
          GetProductSuccess(:final products) =>
            products.isEmpty
                ? const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      context.read<ProductBloc>().add(GetProduct());
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                  ),
        };
      },
    );
  }
}
