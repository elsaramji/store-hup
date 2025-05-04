// routes.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_hup/components/Home/views/best_seller_viwe.dart';
import 'package:store_hup/components/Home/views/home_view.dart';
import 'package:store_hup/components/cart/views/product_cart_main_view.dart';
import 'package:store_hup/components/factory/factory_tast.dart';
import 'package:store_hup/components/futures/Auth/presentaion/forgetpassword/view/forget_password_viwe.dart';
import 'package:store_hup/components/futures/Auth/presentaion/signin/views/Signin.dart';
import 'package:store_hup/components/futures/onboarding/view/view_main.dart';

final GoRouter router = GoRouter(
  initialExtra: const OnboardView(),
  initialLocation: OnboardView.route,
  routes: [
    GoRoute(
      path: HomeMainView.id,
      pageBuilder: (context, state) => _funnyTransition(HomeMainView()),
    ),
    GoRoute(
      path: BestSellerViwe.id,
      pageBuilder: (context, state) => _funnyTransition(const BestSellerViwe()),
    ),
    GoRoute(
      path: ProductCartMainView.routeName,
      pageBuilder: (context, state) => _funnyTransition(ProductCartMainView()),
    ),
    GoRoute(
      path: Factory.route,
      pageBuilder: (context, state) => _funnyTransition(const Factory()),
    ),
    GoRoute(
      path: ForgetPasswordViwe.routeName,
      pageBuilder: (context, state) => _funnyTransition(ForgetPasswordViwe()),
    ),
    GoRoute(
      path: OnboardView.route,
      pageBuilder: (context, state) => _funnyTransition(const OnboardView()),
    ),
    GoRoute(
      path: Signin.route,
      pageBuilder: (context, state) => _funnyTransition(const Signin()),
    ),
  ],
);
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
