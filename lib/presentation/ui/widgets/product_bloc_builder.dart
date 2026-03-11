import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation.dart';

class ProductBlocBuilder extends StatelessWidget {
  
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state case GetProductLoading _ || ProductInitial _) {
          return const Center(child: CircularProgressIndicator());
        } else if (state case GetProductFailure()) {
          return ErrorView(
            message: state.errorMessage,
            onRetry: () => context.read<ProductBloc>().add(GetProduct()),
          );
        } else if (state case GetProductSuccess()) {
          final products = state.products;
          if (products.isEmpty) {
            return const Center(
              child: Text(
                'No products found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
          return RefreshIndicator(
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
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
