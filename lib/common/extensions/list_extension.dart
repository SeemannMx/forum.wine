import 'package:flutter/material.dart';

extension AddSpaceBetweenWidgetExtension on List<Widget> {
  /// Adds space between EVERY widget.
  List<Widget> withSpace(double space) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0)
            SizedBox(
              height: space,
              width: space,
            ),
          this[i],
        ],
      ];

  /// Adds space between EVERY SECOND widget.
  List<Widget> withModularSpace(double space) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0 && (i % 2 == 0))
            SizedBox(
              height: space,
              width: space,
            ),
          this[i],
        ],
      ];
}
