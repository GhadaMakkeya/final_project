import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veloura/core/theme/theme_states.dart';

class ThemeCubit extends Cubit<ThemeState>{
  static const _key='isDark';

  ThemeCubit():super(LightTheme());


  Future<void> loadTheme()async{
    final prefs = await SharedPreferences.getInstance();
    final isDark =prefs.getBool(_key)??false;
    emit(isDark?DarkTheme():LightTheme());
  }


  Future<void>setLight()async{
    final prefs =await SharedPreferences.getInstance();
    await prefs.setBool(_key, false);
    emit(LightTheme());
  }


  Future<void>setDark()async{
    final prefs =await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    emit(DarkTheme());
  }
}