import 'package:flutter/material.dart';

class AppLoadingScreen extends StatelessWidget {
  const AppLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Container(
      //   margin: const EdgeInsets.all(Spacing.S),
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       fixedSize: const Size(
      //         Spacing.MAX,
      //         Spacing.XL,
      //       ),
      //     ),
      //     onPressed: () => context.go('${AppScreen.path}${HomeScreen.path}'),
      //     child: const Text('zurück'),
      //   ),
      // ),
    );
  }
}
