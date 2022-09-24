import 'package:flutter/material.dart';
import 'package:wine/common/common.dart';

class AppWebView extends StatelessWidget {
  final String url;
  final VoidCallback onBack;

  const AppWebView({Key? key, required this.url, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
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
          onPressed: onBack,
          child: const Text('zurück'),
        ),
      ),
    );
  }
}
