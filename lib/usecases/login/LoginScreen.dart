import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/usecases/usescases.dart';

class LoginScreen extends StatelessWidget {
  static const String path = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              context.go('${AppScreen.path}${HomeScreen.path}');
            },
            child: Text('login')),
      ),
    );
  }
}
