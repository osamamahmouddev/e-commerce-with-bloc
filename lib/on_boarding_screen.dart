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
            context.push(Routes.initial);
          },
          child: Text("see all products"),
        ),
      ),
    );
  }
}
