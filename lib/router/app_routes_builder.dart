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
          ),
        ],
      ),
    ];
  }
}
