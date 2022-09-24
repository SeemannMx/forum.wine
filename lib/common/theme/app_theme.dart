import 'package:flutter/material.dart';
import 'package:wine/common/spacing.dart';
import 'package:wine/common/theme/app_colors.dart';

class AppTheme {
  static ThemeData data() {
    return ThemeData(
      primaryColor: AppColors.primary,
      disabledColor: AppColors.disabled,
      toggleableActiveColor: AppColors.primary,
      backgroundColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      iconTheme: _iconTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      cardTheme: _cardTheme,
      dividerTheme: _dividerTheme,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.secondary,
      thickness: .1,
      indent: Spacing.S,
      endIndent: Spacing.S,
    );
  }

  static ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondary,
      surface: AppColors.background,
      onSurface: AppColors.secondary,
      background: AppColors.background,
      onBackground: AppColors.background,
      error: AppColors.error,
      onError: AppColors.error,
    );
  }

  static CardTheme get _cardTheme {
    return const CardTheme(
      color: AppColors.backgroundCardDark,
    );
  }

  static IconThemeData get _iconTheme {
    return const IconThemeData(
      size: Spacing.M,
      color: AppColors.primary,
    );
  }

  static ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.primary,
      circularTrackColor: AppColors.disabled,
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: AppColors.selected,
      selectedIconTheme: IconThemeData(
        size: FontSize.icon,
        color: AppColors.selected,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: FontSize.overline,
        color: AppColors.selected,
      ),
      unselectedItemColor: AppColors.unselected,
      unselectedIconTheme: IconThemeData(
        size: FontSize.overline,
        color: AppColors.unselected,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: FontSize.MIN,
        color: AppColors.unselected,
      ),
      backgroundColor: AppColors.backgroundLight,
      type: BottomNavigationBarType.fixed,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, Spacing.XL),
        primary: AppColors.primary,
        onPrimary: AppColors.text,
        textStyle: _textTheme.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacing.MAX),
        ),
      ),
    );
  }

  static TextTheme get errorTextTheme {
    return const TextTheme(
      overline: AppTextStyle.error,
    );
  }

  static TextTheme get _textTheme {
    return const TextTheme(
      headline1: AppTextStyle.headline1,
      headline2: AppTextStyle.headline2,
      headline3: AppTextStyle.headline3,
      bodyText1: AppTextStyle.body1,
      overline: AppTextStyle.overline,
      button: AppTextStyle.button,
    );
  }
}

class AppTextStyle {
  static const TextStyle headline1 = TextStyle(
    fontSize: FontSize.h1,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: FontSize.h2,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: FontSize.h3,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: FontSize.body1,
    color: AppColors.text,
  );

  static const TextStyle button = TextStyle(
    fontSize: FontSize.button,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle overline = TextStyle(
    fontSize: FontSize.overline,
  );

  static const TextStyle error = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    fontSize: FontSize.error,
  );
}
