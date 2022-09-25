import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/common.dart';
import 'package:wine/common/theme/app_colors.dart';

class CameraScreen extends StatelessWidget {
  static const String path = 'camera';

  CameraScreen({Key? key}) : super(key: key);

  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>?>(
      future: checkForCamera(context),
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

  Future<List<CameraDescription>?> checkForCamera(BuildContext context) async {
    IosDeviceInfo iosInfo;

    try {
      iosInfo = await deviceInfo.iosInfo;

      if (iosInfo.isNotSupported) {
        // ignore: use_build_context_synchronously
        _onNotSupported(context);
        return null;
      } else {
        return await availableCameras();
      }
    } catch (e) {
      log('iOS Errror: ${e.toString()}');
    }
    return null;
  }

  void _onNotSupported(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Deine iOS Version unterstüzt die Kamera nicht.'),
      backgroundColor: AppColors.error,
    ));
    context.pop();
  }
}

extension Verify on IosDeviceInfo {
  bool get isNotSupported =>
      systemVersion == null || (systemVersion != null && double.parse(systemVersion!) < 10.0) || !isPhysicalDevice;
}
