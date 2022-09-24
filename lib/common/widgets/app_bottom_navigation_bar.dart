import 'package:flutter/material.dart';
import 'package:wine/common/spacing.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int index;
  final List<BottomNavigationBarItem> items;
  final Function(int) onTap;

  const AppBottomNavigationBar({
    Key? key,
    required this.index,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Spacing.S),
        topRight: Radius.circular(Spacing.S),
      ),
      child: SizedBox(
        height: Spacing.XXL,
        child: BottomNavigationBar(
          currentIndex: index,
          items: items,
          onTap: onTap,
        ),
      ),
    );
  }
}
