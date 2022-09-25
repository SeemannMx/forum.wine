import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/common.dart';
import 'package:wine/usecases/usescases.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('error'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(Spacing.S),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
              Spacing.MAX,
              Spacing.XL,
            ),
          ),
          onPressed: () => context.go('${AppScreen.path}${HomeScreen.path}'),
          child: const Text('zurück'),
        ),
      ),
    );
  }
}
