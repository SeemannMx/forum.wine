import 'package:flutter/material.dart';

extension DefaultControl on PageController {
  void animateToIndex(int index) {
    animateToPage(
      index,
      duration: const Duration(milliseconds: 10),
      curve: Curves.ease,
    );
  }
}
