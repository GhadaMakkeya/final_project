import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veloura/core/routing/app_routes.dart';
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
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';
import 'package:veloura/features/managment/data/data_sources/add_product_remote_data_source.dart';
import 'package:veloura/features/managment/data/services/product_service.dart';
import 'package:veloura/features/managment/presentation/cubits/add_product_cubit.dart/cubit/add_product_cubit.dart';
import 'package:veloura/features/managment/presentation/cubits/categery_cubit/cubit/category_cubit.dart';
import 'package:veloura/features/managment/presentation/cubits/management_cubit/management_cubit.dart';
import 'package:veloura/features/managment/presentation/screens/management_screen.dart';
import 'package:veloura/features/product_details/data/add_review_remote_data_source.dart';
import 'package:veloura/features/product_details/presentation/cubits/reviews_cubit.dart';

late double screenWidth;
late double screenHeight;
late Widget startScreen;


  final Dio dio = Dio();
  final SecureStorageServices secureStorage = SecureStorageServices();

  final ProductRemoteDataSource productRemoteDataSource =
      ProductRemoteDataSource(dio, secureStorage);

  final CartRemoteDataSource cartRemoteDataSource = CartRemoteDataSource(
    dio,
    secureStorage,
  );

  final ProductService productService = ProductService(secureStorage);

  final String? token = await secureStorage.getAccessToken();
  final bool isLoggedIn = token != null && token.isNotEmpty;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReviewsCubit(
            AddReviewRemoteDataSource(Dio(), SecureStorageServices()),
          ),
        ),

        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        BlocProvider(create: (_) => ProductsCubit()),
        BlocProvider(create: (_) => OffersCubit()),
        BlocProvider(create: (_) => ManagementCubit(productService)),
        BlocProvider(create: (_) => CartCubit(cartRemoteDataSource)),
        BlocProvider(
          create: (_) =>
              SignUpCubit(SignUpRemoteDataSource(dio, secureStorage)),
        ),
        BlocProvider(create: (_) => OtpCubit(OtpRemoteDataSource(dio))),
        BlocProvider(
          create: (_) => LoginCubit(LoginRemoteDataSource(dio), secureStorage),
        ),
        BlocProvider(create: (_) => ProductCubit(productRemoteDataSource)),
        BlocProvider(create: (_) => CategoryCubit(productRemoteDataSource)),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Veloura',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: state is DarkTheme ? ThemeMode.dark : ThemeMode.light,

              home: startScreen,
            );
          },
        );
      },
    );
  }
}
