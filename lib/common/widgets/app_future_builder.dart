import 'package:flutter/material.dart';
import 'package:wine/common/common.dart';

class AppFutureBuilder extends StatelessWidget {
  final Widget child;
  final Future future;

  const AppFutureBuilder({
    Key? key,
    required this.future,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingScreen();
        }

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return child;
        }

        if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
          return const Placeholder();
        }

        return const Placeholder();
      },
    );
  }
}
