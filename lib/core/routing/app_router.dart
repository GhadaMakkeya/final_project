import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/routing/app_routes.dart';
import 'package:veloura/core/widgets/bottom_nav_bar.dart';
import 'package:veloura/features/auth/forget_password/presentation/controller/forget_password_cubit.dart';
import 'package:veloura/features/auth/login/presentation/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:veloura/features/auth/login/presentation/screens/login_screen.dart';
import 'package:veloura/features/auth/otp/presentation/cubits/cubit/otp_cubit.dart';
import 'package:veloura/features/auth/reset_password/presentation/cubits/reset_password_cubit.dart';
import 'package:veloura/features/auth/signup/presentation/cubits/sign_up_cubit.dart';
import 'package:veloura/features/auth/signup/presentation/screens/sign_up_screen.dart';
import 'package:veloura/features/auth/otp/presentation/screens/otp_screen.dart';
import 'package:veloura/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:veloura/features/auth/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:veloura/features/category/presentation/products_filtered_cubit/products_filtered_cubit.dart';
import 'package:veloura/features/home/data/models/product_model.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_cubit.dart';
import 'package:veloura/features/managment/presentation/screens/add_product_screen.dart';
import 'package:veloura/features/managment/presentation/screens/management_screen.dart';
import 'package:veloura/features/category/presentation/screens/category_screen.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/managment/presentation/cubits/add_product_cubit.dart/cubit/add_product_cubit.dart';
import 'package:veloura/features/managment/presentation/cubits/management_cubit/management_cubit.dart';
import 'package:veloura/features/product_details/presentation/cubits/reviews_cubit.dart';
import 'package:veloura/features/product_details/presentation/screens/product_details_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ─────────────── AUTH ───────────────
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );

      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SignUpCubit(),
            child: const SignUpScreen(),
          ),
        );
      case AppRoutes.otp:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => OtpCubit(),
            child: OtpScreen(
              email: args['email'],
              isPasswordReset: args['isPasswordReset'] ?? false,
            ),
          ),
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                ForgetPasswordCubit(),
            child: const ForgetPassword(),
          ),
        );

      case AppRoutes.resetPassword:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                ResetPasswordCubit(),
            child: ResetPasswordScreen(email: args['email'], otp: args['otp']),
          ),
        );
      // ─────────────── MAIN NAVIGATION ───────────────
      case AppRoutes.mainNavigation:
        return MaterialPageRoute(builder: (_) => const MainNavigation());

      // ─────────────── CATEGORY FILTER ───────────────
      case AppRoutes.productsFilteredByCategory:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    ProductsFilterByCategoryCubit()
                      ..filterProducts(categoryName: categoryName),
              ),
            ],
            child: CategoryScreen(categoryName: categoryName),
          ),
        );

      // ─────────────── ADD PRODUCT ───────────────
      case AppRoutes.addProduct:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AddProductCubit()),
              BlocProvider(create: (_) => CategoryCubit()),
            ],
            child: const AddNewProductScreen(),
          ),
        );
      case AppRoutes.productDetails:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => CartCubit()),
              BlocProvider(create: (_) => ReviewsCubit()),
            ],
            child: ProductDetailsScreen(product: product),
          ),
        );

      // ─────────────── MANAGEMENT ───────────────
      case AppRoutes.management:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ManagementCubit()),
              BlocProvider(create: (_) => ProductsCubit()),
            ],
            child: const ManagementScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
