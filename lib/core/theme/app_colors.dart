import 'package:flutter/material.dart';
 
abstract final class BaseColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Color(0x00000000);
 
  static const alert   = Color(0xFFD32F2F);
  static const warning = Color(0xFFF57C00);
  static const info    = Color(0xFF1976D2);
  static const success = Color(0xFF388E3C);
}
 
class AppColors {
  AppColors._();
  static final lightColors = _LightColors();
  static final darkColors  = _DarkColors();
 
  static MyColors colors(BuildContext context) =>
      Theme.of(context).extension<MyColors>() ?? AppColors.lightColors;
}
 
abstract class MyColors extends ThemeExtension<MyColors> {
  MyColors();
 
  Color get primary;      
  Color get secondary;     
  Color get gold;          
 
  Color get background;    
  Color get cardColor;     
  Color get authCardColor; 

  Color get textPrimary; 
  Color get textSecondary; 
  Color get textTertiary;  
 
  Color get border;       
 
  Color get chipSelectedColor;
  Color get chipUnSelectedColor;
  Color get chipSelectedText;
  Color get chipUnSelectedText;
 
  @override
  ThemeExtension<MyColors> copyWith() => this;
 
  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return other;
  }
}
 
class _LightColors extends MyColors {
  @override Color get primary => const Color(0xFF1A1F3D);
 
  @override Color get secondary => const Color(0xFFF5F2EE);
 
  @override Color get gold => const Color(0xFFC9A96E);
 
  @override Color get background => const Color(0xFFF0EDE8);
 
  @override Color get cardColor => const Color(0xFFF0EDE8);
 
  @override Color get authCardColor => const Color(0xFFFFFFFF);

  @override Color get border => const Color(0xFFE8E4DF);
 
  @override Color get textPrimary => const Color(0xFF1A1A2E);

  @override Color get textSecondary => const Color(0xFF6B6460);

  @override Color get textTertiary => const Color(0xFFABA8A4);
 
  @override Color get chipSelectedColor   => const Color(0xFF1A1F3D);
  @override Color get chipUnSelectedColor => Colors.transparent;
  @override Color get chipSelectedText    => const Color(0xFFFFFFFF);
  @override Color get chipUnSelectedText  => const Color(0xFF1A1F3D);
}
 
class _DarkColors extends MyColors {

  @override Color get primary => const Color(0xFFC9A96E);

  @override Color get secondary => const Color(0xFF0C2340);

  @override Color get gold => const Color(0xFFC9A96E);
 
  @override Color get background => const Color(0xFF050F1E);
 
  @override Color get cardColor => const Color(0xFF0C2340);
 
  @override Color get authCardColor => const Color(0xFF0F2847);
 
  @override Color get border => const Color(0xFF1E3A5F);
 
  @override Color get textPrimary => const Color(0xFFEDE8E0);
 
  @override Color get textSecondary => const Color(0xFFB0A898);
 
  @override Color get textTertiary => const Color(0xFF7A7268);
 
  @override Color get chipSelectedColor   => const Color(0xFFC9A96E);
  @override Color get chipUnSelectedColor => Colors.transparent;
  @override Color get chipSelectedText    => const Color(0xFF050F1E);
  @override Color get chipUnSelectedText  => const Color(0xFFC9A96E);
}
 
extension ColorExt on BuildContext {
  MyColors get colors => AppColors.colors(this);
}
 