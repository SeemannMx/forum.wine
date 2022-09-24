import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/widgets/app_web_view.dart';

class PremiumScreen extends StatelessWidget {
  static const String path = 'premium';

  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppWebView(
        url: 'https://www.vinum.eu/de/yoopress-news/weinszene/2020/die-besten-winzer-der-weinregion-pfalz/',
        onBack: () => context.pop(),
      ),
    );
  }
}
