import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wine/common/common.dart';
import 'package:wine/common/theme/app_colors.dart';
import 'package:wine/common/theme/app_theme.dart';

class AppCamera extends StatefulWidget {
  final CameraDescription camera;

  final VoidCallback onBack;

  const AppCamera({Key? key, required this.onBack, required this.camera}) : super(key: key);

  @override
  State<AppCamera> createState() => _AppCameraState();
}

class _AppCameraState extends State<AppCamera> with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController _controller;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _controller.initialize()
      ..then((_) => mounted ? setState(() {}) : null)
      ..catchError((e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              log('User denied camera access.');
              break;
            default:
              log('Handle other errors.');
              break;
          }
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (_controller == null || !_controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.inactive:
        _controller.dispose();

        break;
      case AppLifecycleState.resumed:
        break;
      default:
        log(state.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          _controller.takePicture().then((XFile? file) {
            if (mounted) {
              setState(() {
                imageFile = file;
              });
              if (file != null) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      padding: const EdgeInsets.only(top: Spacing.S, left: Spacing.S, right: Spacing.S),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(Spacing.L)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.backgroundCardDark,
                              AppColors.backgroundCardLight,
                              AppColors.primary,
                            ],
                          )),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 45,
                                child: Padding(
                                  padding: const EdgeInsets.all(Spacing.M),
                                  child: Image.asset(homeCameraDummyBottle),
                                ),
                              ),
                              Flexible(
                                flex: 55,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bernard Koch',
                                      style: AppTheme.data().textTheme.headline2,
                                    ),
                                    Divider(),
                                    Text(
                                      'Deutschland',
                                      style: AppTheme.data().textTheme.headline3,
                                    ),
                                    Text(
                                      'Pinot Nior',
                                      style: AppTheme.data().textTheme.headline3,
                                    ),
                                    Text(
                                      '2020',
                                      style: AppTheme.data().textTheme.headline3,
                                    ),
                                  ].withSpace(Spacing.S),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                dummyText,
                                textAlign: TextAlign.justify,
                                style: AppTheme.data().textTheme.bodyText1,
                              ),
                              Text(
                                dummyText,
                                textAlign: TextAlign.justify,
                                style: AppTheme.data().textTheme.bodyText1,
                              ),
                              Text(
                                dummyText,
                                textAlign: TextAlign.justify,
                                style: AppTheme.data().textTheme.bodyText1,
                              ),
                              Text(
                                dummyText,
                                textAlign: TextAlign.justify,
                                style: AppTheme.data().textTheme.bodyText1,
                              ),
                            ].withSpace(Spacing.MIN),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }
          });
        },
        child: Stack(
          children: [
            Center(
              child: CameraPreview(_controller),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(Spacing.S),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
              Spacing.MAX,
              Spacing.XL,
            ),
          ),
          onPressed: widget.onBack,
          child: Text('zurück'),
        ),
      ),
    );
  }
}
