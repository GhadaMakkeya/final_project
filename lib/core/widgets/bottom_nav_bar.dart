import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veloura/core/theme/app_colors.dart';
import 'package:veloura/features/cart/presentation/screens/shopping_cart_screen.dart';
import 'package:veloura/features/home/presentation/cubits/categery_cubit/category_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/product_action_cubit/product_action_cubit.dart';
import 'package:veloura/features/home/presentation/screens/home_screen.dart';
import 'package:veloura/features/products/presntation/screens/products_screen.dart';
import 'package:veloura/features/profile/presentation/screens/profile_screen.dart';
import 'package:veloura/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:veloura/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:veloura/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductsCubit()),
        BlocProvider(create: (_) => OffersCubit()),
        BlocProvider(create: (_) => CategoryCubit()),
      ],
      child: const HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductsCubit()),
        BlocProvider(create: (_) => CategoryCubit()),
        BlocProvider(create: (_) => ProductsActionCubit()),
      ],
      child: const ProductScreen(),
    ),
    BlocProvider(
      create: (_) => CartCubit(),
      child: const ShoppingCartScreen(),
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: colors.cardColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colors.primary,
          unselectedItemColor: colors.textTertiary,
          selectedFontSize: 12.sp,
          unselectedFontSize: 12.sp,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}