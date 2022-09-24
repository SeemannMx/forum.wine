import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wine/common/common.dart';

class WinzerScreen extends StatelessWidget {
  static const String path = 'winzer';

  const WinzerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const WebView(
          initialUrl: 'https://forumpfalz.de/winzer',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.all(Spacing.S),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(Spacing.MAX, Spacing.XL),
            ),
            onPressed: () {
              context.pop();
            },
            child: const Text('zurück'),
          ),
        ),
      ),
    );
  }
}
