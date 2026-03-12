import 'package:flutter/material.dart';

import '../presentation.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products'), centerTitle: true),
      body: const ProductBlocBuilder(),
    );
  }
}
