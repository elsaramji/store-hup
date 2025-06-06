// routes.dart






import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/Auth/presentetion/views/forget_password_viwe.dart';
import '../../features/Auth/presentetion/views/signin_view.dart';
import '../../features/Auth/presentetion/views/signup_view.dart';
import '../../features/Home/views/best_seller_viwe.dart';
import '../../features/Home/views/home_view.dart';
import '../../features/cart/views/product_cart_main_view.dart';
import '../../features/factory/factory_tast.dart';
import '../../features/onboarding/view/bording_view.dart';
import '../../service/database/presence.dart';
import '../constant/keys.dart';

bool onBorarding() => Preferences.getBool(Keys.isviewedOnBoarding);
final GoRouter router = GoRouter(
  initialLocation: onBorarding() ? Signin.route : OnboardView.route,
  routes: [
    GoRoute(
      path: HomeMainView.route,
      pageBuilder: (context, state) => _easyTransition(HomeMainView()),
    ),
    GoRoute(
      path: BestSellerViwe.id,
      pageBuilder: (context, state) => _easyTransition(const BestSellerViwe()),
    ),
    GoRoute(
      path: ProductCartMainView.routeName,
      pageBuilder: (context, state) => _easyTransition(ProductCartMainView()),
    ),
    GoRoute(
      path: Factory.route,
      pageBuilder: (context, state) => _easyTransition(const Factory()),
    ),
    GoRoute(
      path: ForgetPasswordViwe.route,
      pageBuilder: (context, state) => _easyTransition(ForgetPasswordViwe()),
    ),
    GoRoute(
      path: OnboardView.route,
      pageBuilder: (context, state) => _easyTransition(const OnboardView()),
    ),
    GoRoute(
      path: Signin.route,
      pageBuilder: (context, state) => _easyTransition(const Signin()),
    ),
    GoRoute(
      path: SignupMainviwe.route,
      pageBuilder: (context, state) => _easyTransition( SignupMainviwe()),
    ),
  ],
);

CustomTransitionPage _easyTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final opacityAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation);

      return FadeTransition(
        opacity: opacityAnimation,
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0.95,
            end: 1,
          ).animate(animation),
          child: child,
        ),
      );
    },
  );
}





/*
/// Make fun transition as commit
CustomTransitionPage _funnyTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1.0, -1.0),
        end: Offset.zero,
      ).animate(animation);

      final rotateAnimation =
          Tween<double>(begin: 0.5, end: 0).animate(animation);

      return SlideTransition(
        position: offsetAnimation,
        child: RotationTransition(
          turns: rotateAnimation,
          child: child,
        ),
      );
    },
  );
}
*/