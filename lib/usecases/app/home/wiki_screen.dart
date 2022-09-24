import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/widgets/app_web_view.dart';

class WikiScreen extends StatelessWidget {
  static const String path = 'wiki';

  const WikiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppWebView(
        url: 'https://www.wein-wissen.net',
        onBack: () => context.pop(),
      ),
    );
  }
}
