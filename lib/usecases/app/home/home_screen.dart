import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/common.dart';
import 'package:wine/common/theme/app_colors.dart';
import 'package:wine/common/theme/app_theme.dart';
import 'package:wine/usecases/usescases.dart';

class HomeScreen extends StatelessWidget {
  static const String path = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 0.3;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * height,
            child: Container(
              margin: const EdgeInsets.all(Spacing.S),
              decoration: BoxDecoration(
                  border: Border.all(
                color: AppColors.secondary,
              )),
              child: Stack(children: [
                Image.asset(homeSpecials),
                Center(
                  child: Container(
                    height: FontSize.MAX,
                    color: AppColors.secondary.withAlpha(235),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'SPECIALS  ',
                      style: TextStyle(
                        fontSize: AppTheme.data().textTheme.headline1!.fontSize,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * height,
            margin: EdgeInsets.symmetric(horizontal: Spacing.XS + Spacing.MIN),
            child: Container(
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 50,
                    child: Card(
                      elevation: 1,
                      child: InkWell(
                        onTap: () {
                          context.go('${AppScreen.path}${HomeScreen.path}/${WinzerScreen.path}');
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Winzer',
                              style: TextStyle(
                                fontSize: AppTheme.data().textTheme.headline2!.fontSize,
                                color: AppColors.text,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 50,
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 50,
                          child: Card(
                            elevation: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Premium',
                                    style: TextStyle(
                                      fontSize: AppTheme.data().textTheme.headline2!.fontSize,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 50,
                          child: Card(
                            elevation: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Sekt',
                                    style: TextStyle(
                                      fontSize: AppTheme.data().textTheme.headline2!.fontSize,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Spacing.S),
            // height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dummyText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data().textTheme.bodyText1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Spacing.S),
                  child: ElevatedButton(
                    child: Row(
                      children: [
                        const Flexible(
                          flex: 15,
                          fit: FlexFit.tight,
                          child: Icon(Icons.camera_alt),
                        ),
                        Flexible(
                          flex: 85,
                          fit: FlexFit.tight,
                          child: Text(
                            'fotografieren und mehr erfahren',
                            style: AppTheme.data().textTheme.button,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Text(
                  dummyText,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: AppTheme.data().textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.310,
            child: Card(
              margin: EdgeInsets.all(Spacing.S),
              child: Container(),
            ),
          ),
        ].withSpace(Spacing.MIN),
      ),
    );
  }
}
