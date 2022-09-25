import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/common.dart';

class CameraScreen extends StatelessWidget {
  static const String path = 'camera';

  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const AppErrorScreen();

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          List<CameraDescription> cameras = snapshot.data!;

          return AppCamera(
            camera: cameras[0],
            onBack: () => context.pop(),
          );
        }

        return const AppLoadingScreen();
      },
    );
  }
}
