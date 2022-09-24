import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialsScreen extends StatelessWidget {
  static const String path = 'specials';

  const SpecialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('zurück'),
          onPressed: () => context.pop(),
        ),
      ),
    ));
  }
}
