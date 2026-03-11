import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/core.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.goNamed(
              Routes.product,
              queryParameters: {},
              pathParameters: {"productId": "1111"},
            );
          },
          child: Text("see all products"),
        ),
      ),
    );
  }
}
