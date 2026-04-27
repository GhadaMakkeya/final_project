/*import 'package:go_router/go_router.dart';
import 'package:veloura/core/routing/app_routes.dart';
import 'package:veloura/core/routing/main_scaffold.dart';
import 'package:veloura/features/home/presentation/home_screen.dart';
import 'package:veloura/features/onboarding/presentation/onboarding_screen.dart';
final GoRouter router = GoRouter(
  initialLocation: AppRoutes.onboarding, 
  
  routes: [
    // 1. المسارات المستقلة (خارج الـ Bottom Nav Bar)
    GoRoute(
      path: AppRoutes.onboarding, // تأكد أن القيمة تبدأ بـ / (مثلاً: '/onboarding')
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: AppRoutes.addProduct, // تأكد أنها '/add-product'
      builder: (context, state) => const AddProductScreen(),
    ),

    // 2. التنقل داخل الـ Bottom Nav Bar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // نمرر الـ navigationShell للـ Scaffold لعرض الصفحات داخله
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.discover,
              builder: (context, state) => const DiscoverScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favourites,
              builder: (context, state) => const FavouritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);*/