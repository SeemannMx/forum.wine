import 'package:flutter/material.dart';
import 'package:wine/common/theme/app_theme.dart';
import 'package:wine/router/app_router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter router;

  @override
  void initState() {
    super.initState();
    router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      restorationScopeId: 'app',
      onGenerateTitle: (context) => 'Wine',
      theme: AppTheme.data(),
    );
  }
}
