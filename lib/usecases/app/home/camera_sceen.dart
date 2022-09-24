import 'package:flutter/material.dart';
import 'package:wine/common/common.dart';

class CameraScreen extends StatelessWidget {
  static const String path = 'camera';

  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: AppCamera(),
    );
  }
}
