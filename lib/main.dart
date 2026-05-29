import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/theme/app_theme.dart';
import 'package:veloura/core/theme/theme_cubit.dart';
import 'package:veloura/core/theme/theme_states.dart';
import 'package:veloura/core/widgets/bottom_nav_bar.dart';
import 'package:veloura/features/app_starting/app_startup.dart';
// استيراد ملف الراوتر والـ Cubit الخاص بالمنتجات
import 'package:veloura/core/routing/app_router.dart'; 
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:veloura/features/onboarding/presentation/widgets/onboarding_page_content.dart';

late double screenWidth;
late double screenHeight;
late Widget startScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startScreen = await getStartScreen();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        //  حل مشكلة الـ Cubit: توفير ProductsCubit على مستوى التطبيق بالكامل
        BlocProvider(create: (_) => ProductsCubit()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        screenWidth = ScreenUtil().screenWidth;
        screenHeight = ScreenUtil().screenHeight;

        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: state is DarkTheme ? ThemeMode.dark : ThemeMode.light,
              onGenerateRoute: AppRouter.generateRoute,            
              home: OnboardingScreen(),
            );
          },
        );
      },
    );
  }
}