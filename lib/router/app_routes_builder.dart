import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/usecases/usescases.dart';

class AppRoutesBuilder {
  static List<GoRoute> build() {
    return <GoRoute>[
      GoRoute(
        path: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return AppScreen(bottomBarItemName: HomeScreen.path);
        },
        routes: [
          GoRoute(
              path: ':bottomBarItemName',
              builder: (context, state) {
                final bottomBarItemName = state.params['bottomBarItemName']!;
                return AppScreen(bottomBarItemName: bottomBarItemName);
              },
              routes: [
                GoRoute(
                  path: SpecialsScreen.path,
                  builder: (context, state) => const SpecialsScreen(),
                ),
                GoRoute(
                  path: WinzerScreen.path,
                  builder: (context, state) => const WinzerScreen(),
                ),
                GoRoute(
                  path: WikiScreen.path,
                  builder: (context, state) => const WikiScreen(),
                ),
                GoRoute(
                  path: PremiumScreen.path,
                  builder: (context, state) => const PremiumScreen(),
                ),
                GoRoute(
                  path: CameraScreen.path,
                  pageBuilder: (context, state) => const MaterialPage(
                    fullscreenDialog: true,
                    child: CameraScreen(),
                  ),
                  // builder: (context, state) => const CameraScreen(),
                ),
              ]),
        ],
      ),
    ];
  }
}
