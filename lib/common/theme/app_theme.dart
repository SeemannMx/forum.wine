import 'package:flutter/material.dart';
import 'package:wine/common/spacing.dart';
import 'package:wine/common/theme/app_colors.dart';

class AppTheme {
  static ThemeData data() {
    return ThemeData(
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        dividerColor: AppColors.divider,
        disabledColor: AppColors.primary.withOpacity(0.8),
        shadowColor: AppColors.shadow,
        backgroundColor: AppColors.background,
        toggleableActiveColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: _colorScheme,
        textTheme: _textTheme,
        textSelectionTheme: _textSelectionThemeData(),
        chipTheme: _chipTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        iconTheme: _iconTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlineButtonTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
        cardTheme: _cardTheme,
        inputDecorationTheme: getAppInputDecorationTheme(),
        appBarTheme: getAppBarTheme());
  }

  static TextSelectionThemeData _textSelectionThemeData() => const TextSelectionThemeData(cursorColor: AppColors.text);

  static AppBarTheme getAppBarTheme() {
    return const AppBarTheme(
      elevation: 0.5,
      color: AppColors.backgroundCard,
      iconTheme: IconThemeData(
        size: 24,
        color: AppColors.text,
      ),
    );
  }

  static CardTheme get _cardTheme {
    return const CardTheme(
      color: AppColors.backgroundCard,
    );
  }

  static IconThemeData get _iconTheme {
    return const IconThemeData(
      size: 24,
      color: AppColors.primary,
    );
  }

  static ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.text,
      circularTrackColor: AppColors.disabled,
    );
  }

  static ChipThemeData get _chipTheme {
    return const ChipThemeData(
      backgroundColor: AppColors.primary,
      deleteIconColor: AppColors.textComplementary,
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

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: AppColors.selected,
      selectedIconTheme: IconThemeData(size: 18),
      unselectedItemColor: AppColors.unselected,
      unselectedIconTheme: IconThemeData(size: 18),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        color: AppColors.selected,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        color: AppColors.unselected,
      ),
      backgroundColor: AppColors.primary,
      type: BottomNavigationBarType.fixed,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 48),
        primary: AppColors.primary,
        onPrimary: AppColors.textComplementary,
        textStyle: _textTheme.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlineButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 48),
        primary: AppColors.textComplementary,
        backgroundColor: AppColors.primaryDark,
        textStyle: _textTheme.button,
        side: const BorderSide(
          color: AppColors.textComplementary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get outlineButtonSecondaryTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 48),
        primary: AppColors.primaryDark,
        backgroundColor: AppColors.textComplementary,
        textStyle: _textTheme.button,
        side: const BorderSide(
          color: AppColors.primaryDark,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
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

  static InputDecorationTheme getAppInputDecorationTheme() {
    return InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: AppColors.text),
      labelStyle: AppTextStyle.textFieldHintEmptyStyle,
      hintStyle: AppTextStyle.body1.copyWith(color: AppColors.text),
      contentPadding: const EdgeInsets.all(Spacing.MIN),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.disabled),
        borderRadius: BorderRadius.circular(Spacing.MIN),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(Spacing.MIN),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.text),
        borderRadius: BorderRadius.circular(Spacing.MIN),
      ),
      errorStyle: const TextStyle(
        fontSize: 9.0,
        height: 0.5,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.text),
        borderRadius: BorderRadius.circular(Spacing.MIN),
      ),
    );
  }

  static ThemeData getAndroidPickerTheme() {
    return ThemeData(
      dialogBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
      ),
    );
  }
}

class AppTextStyle {
  // headlines
  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 18,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: 14,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );

  // body
  static const TextStyle body1 = TextStyle(
    fontSize: 14,
    color: AppColors.text,
  );

  // button
  static const TextStyle button = TextStyle(
    fontSize: 16,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textFieldHintEmptyStyle = TextStyle(
    fontSize: 14,
    color: AppColors.disabled,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textFieldHintFilledStyle = TextStyle(
    fontSize: 14,
    color: AppColors.text,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle overline = TextStyle(fontSize: 12);

  static const TextStyle error = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    fontSize: 9,
  );
}
