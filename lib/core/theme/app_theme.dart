import 'package:flutter/material.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static final light = _build(Brightness.light);
  static final dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colors = isDark ? AppColors.darkColors : AppColors.lightColors;
    final colorScheme = isDark ? ColorScheme.dark : ColorScheme.light;

    return ThemeData(
      useMaterial3: true,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: colors.background,
      extensions: [colors],
      colorScheme: colorScheme(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.cardColor,
      ),
      appBarTheme: _appBarTheme(colors),
      navigationBarTheme: _navigationBarTheme(colors),
      textTheme: AppTextTheme.textTheme(colors),
      iconTheme: IconThemeData(color: colors.primary),
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: 0.5,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? colors.primary : Colors.transparent),
        side: BorderSide(color: colors.border),
      ),
    );
  }

  static AppBarTheme _appBarTheme(MyColors colors) {
    return AppBarTheme(
      backgroundColor: colors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: colors.primary),
      actionsIconTheme: IconThemeData(color: colors.primary),
    );
  }

  static NavigationBarThemeData _navigationBarTheme(MyColors colors) {
    return NavigationBarThemeData(
      shadowColor: Colors.transparent,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      backgroundColor: colors.background,
      indicatorColor: Colors.transparent,
      elevation: 5,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      surfaceTintColor: Colors.transparent,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? colors.primary
              : colors.textSecondary,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return TextStyle(
          fontSize: 11,
          letterSpacing: 0.5,
          color: states.contains(WidgetState.selected)
              ? colors.primary
              : colors.textSecondary,
        );
      }),
    );
  }
}