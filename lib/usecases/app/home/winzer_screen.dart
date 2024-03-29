import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/widgets/app_web_view.dart';

class WinzerScreen extends StatelessWidget {
  static const String path = 'winzer';

  const WinzerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppWebView(
        url: 'https://forumpfalz.de/winzer',
        onBack: () => context.pop(),
      ),
    );
  }
}
