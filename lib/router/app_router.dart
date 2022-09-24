import 'package:go_router/go_router.dart';
import 'package:wine/router/app_routes_builder.dart';
import 'package:wine/usecases/usescases.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          debugLogDiagnostics: true,
          routes: AppRoutesBuilder.build(),
          initialLocation: LoginScreen.path,
        );
}
