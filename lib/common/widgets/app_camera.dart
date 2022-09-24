import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppCamera extends StatelessWidget {
  const AppCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('zurück'),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
