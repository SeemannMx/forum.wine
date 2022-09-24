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
    const height = 0.275;

    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.go('${AppScreen.path}${HomeScreen.path}/${SpecialsScreen.path}');
            },
            child: Container(
              height: MediaQuery.of(context).size.height * height,
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
                  child: Text(
                    'SPECIALS  ',
                    style: TextStyle(
                      fontSize: AppTheme.data().textTheme.headline1!.fontSize,
                      color: AppColors.primary,
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
                              onTap: () {
                                context.go('${AppScreen.path}${HomeScreen.path}/${PremiumScreen.path}');
                              },
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
                              onTap: () {
                                context.go('${AppScreen.path}${HomeScreen.path}/${WikiScreen.path}');
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Wiki',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dummyText,
                  maxLines: 3,
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
                    onPressed: () {
                      context.push('${AppScreen.path}${HomeScreen.path}/${CameraScreen.path}');
                    },
                  ),
                ),
                Text(
                  dummyText,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                  style: AppTheme.data().textTheme.bodyText1,
                ),
              ],
            ),
          ),
          ...[
            ArticleCard(
              imagePath: homeArticleBar,
              title: 'Das "Cuvée" die hippe Vinothek in Speyer',
              subTitle: dummyText,
              onArticle: () {},
            ),
            ArticleCard(
              imagePath: homeArticleBottles,
              title: 'Die Geschichte der Weinflasche',
              subTitle: 'Von der Tokayerflasche bis zum Bocksbeutel ...',
              onArticle: () {},
            ),
            ArticleCard(
              imagePath: homeArticleCellar,
              title: 'Wie öffnen die Schatzkammer',
              subTitle: dummyText,
              onArticle: () {},
            ),
            ArticleCard(
              imagePath: homeArticleGrapes,
              title: 'Die bekannteste Rebsorte ist ...',
              subTitle: dummyText,
              onArticle: () {},
            ),
            const SizedBox(height: Spacing.S)
          ].withSpace(Spacing.S),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final VoidCallback onArticle;

  const ArticleCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.onArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onArticle,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Spacing.XS)),
            border: Border.all(
              color: AppColors.backgroundCardLight,
            )),
        margin: const EdgeInsets.symmetric(horizontal: Spacing.S),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(Spacing.XS)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(Spacing.S),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: AppTheme.data().textTheme.headline2!.fontSize,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: AppTheme.data().textTheme.headline3!.fontSize,
                        color: AppColors.primary.withAlpha(100),
                      ),
                    ),
                  ),
                ].withSpace(Spacing.XS),
              ),
            )
          ],
        ),
      ),
    );
  }
}
