import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key, required this.text, this.route});
  final String text;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(fontSize: 24)),

            SizedBox(height: 20),
            route != null
                ? ElevatedButton(
                    onPressed: () => context.push(route!),
                    child: const Text('see all products'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
