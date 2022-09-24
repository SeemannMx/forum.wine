import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wine/common/common.dart';
import 'package:wine/usecases/usescases.dart';

class AppScreen extends StatefulWidget {
  static const String path = '/';

  final String bottomBarItemName;

  final screens = [
    const Screen(
      path: HomeScreen.path,
      child: HomeScreen(),
    ),
    const Screen(
      path: TourScreen.path,
      child: TourScreen(),
    ),
    const Screen(
      path: WineScreen.path,
      child: WineScreen(),
    ),
    const Screen(
      path: ProfileScreen.path,
      child: ProfileScreen(),
    ),
  ];

  int get index => screens.indexWhere((screen) => screen.path == bottomBarItemName);

  AppScreen({Key? key, required this.bottomBarItemName}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  EdgeInsets get padding => const EdgeInsets.only(bottom: Spacing.MIN);

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.index,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageController.animateToIndex(widget.index);
  }

  List<BottomNavigationBarItem> get items => [
        BottomNavigationBarItem(
          label: 'Start',
          icon: Container(
            padding: padding,
            child: const Icon(
              Icons.account_balance_outlined,
              size: Spacing.M,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Events',
          icon: Container(
            padding: padding,
            child: const Icon(
              Icons.map,
              size: Spacing.M,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Weine',
          icon: Container(
            padding: padding,
            child: const Icon(
              Icons.add_shopping_cart,
              size: Spacing.M,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Mehr',
          icon: Container(
            padding: padding,
            child: const Icon(
              Icons.read_more_outlined,
              size: Spacing.M,
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          onPageChanged: (pageIndex) {
            _currentPageIndex = pageIndex;
            context.go('/${widget.screens[_currentPageIndex].path}');
          },
          controller: _pageController,
          children: widget.screens,
        ),
        bottomNavigationBar: AppBottomNavigationBar(
          index: widget.index,
          items: items,
          onTap: (bottomBarIndex) {
            _currentPageIndex = bottomBarIndex;
            context.go('/${widget.screens[_currentPageIndex].path}');
          },
        ),
      ),
    );
  }
}

/// The [AppScreen] is a wrapper class for screens to handle state changes.
/// For example preserve scroll-position on navigation.
class Screen extends StatefulWidget {
  final String path;
  final Widget child;

  const Screen({
    Key? key,
    required this.path,
    required this.child,
  }) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: widget.child,
    );
  }
}
