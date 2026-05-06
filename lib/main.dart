import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/app_startup.dart';
import 'package:veloura/core/services/secure_storage_services.dart';
import 'package:veloura/core/theme/app_theme.dart';
import 'package:veloura/core/theme/theme_cubit.dart';
import 'package:veloura/core/theme/theme_states.dart';
import 'package:veloura/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:veloura/features/auth/login/presentation/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/auth/otp/data/data_sources/otp_remote_data_source.dart';
import 'package:veloura/features/auth/otp/presentation/cubits/cubit/otp_cubit.dart';
import 'package:veloura/features/auth/signup/data/data_source/sign_up_remote_data_source.dart';
import 'package:veloura/features/auth/signup/presentation/cubits/sign_up_cubit.dart';
import 'package:veloura/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:veloura/features/category/data/services/category_service.dart';
import 'package:veloura/features/category/presentation/controller/category_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/managment/data/data_sources/add_product_remote_data_source.dart';
import 'package:veloura/features/managment/data/services/product_service.dart';
import 'package:veloura/features/managment/presentation/cubits/add_product_cubit.dart/cubit/add_product_cubit.dart';
import 'package:veloura/features/managment/presentation/cubits/management_cubit/management_cubit.dart';

late double screenWidth;
late double screenHeight;
late Widget startScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  startScreen = await getStartScreen();

  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://accessories-eshop.runasp.net/api'),
  );
  final SecureStorageServices secureStorage = SecureStorageServices();

  final AddProductRemoteDataSource addProductRemoteDataSource =
      AddProductRemoteDataSource(dio, secureStorage);
  final CategoryService categoryService = CategoryService(
    dio: dio,
    secureStorage: secureStorage,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        // المنتجات والعروض (Home)
        BlocProvider(create: (_) => ProductsCubit()),
        BlocProvider(create: (_) => OffersCubit()),
        BlocProvider(
          create: (context) =>
              ManagementCubit(service: ProductService(dio, secureStorage)),
        ),
        BlocProvider(
          create: (_) =>
              SignUpCubit(SignUpRemoteDataSource(dio, secureStorage)),
        ),
        BlocProvider(create: (_) => OtpCubit(OtpRemoteDataSource(dio))),

        BlocProvider(
          create: (_) => LoginCubit(LoginRemoteDataSource(dio), secureStorage),
        ),

        BlocProvider(
          create: (_) => AddProductCubit(addProductRemoteDataSource),
        ),

        BlocProvider(create: (_) => CategoryCubit(categoryService)),
        BlocProvider(
          create: (_) => CartCubit(CartRemoteDataSource(dio, secureStorage)),
        ),
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
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}
