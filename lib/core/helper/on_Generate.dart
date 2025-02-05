// core/helper/on_Generate.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/cart/product_cart.dart';
import 'package:store_hup/components/products/view/home_products_view.dart';
import 'package:store_hup/components/profile/user_profile.dart';

import '../../components/Home/views/best_seller_viwe.dart';
import '../../components/Home/views/home_view.dart';
import '../../components/factory/factory_tast.dart';
import '../../components/futures/Auth/forgetpassword/view/forget_password_viwe.dart';
import '../../components/futures/Auth/signin/views/Signin.dart';
import '../../components/futures/Auth/signup/view/signup_view_builder.dart';
import '../../components/futures/Splash/view/splash.dart';
import '../../components/futures/onboarding/view/view_main.dart';

Route<dynamic>? ongenerate(RouteSettings setting) {
  switch (setting.name) {
    case Splash.route:
      return MaterialPageRoute(builder: (context) => const Splash());
    case MainBoards.route:
      return MaterialPageRoute(builder: (context) => const MainBoards());

    case Signin.route:
      return MaterialPageRoute(builder: (context) => const Signin());

    case Signup.route:
      return MaterialPageRoute(builder: (context) => const Signup());

    case ForgetPasswordViwe.routeName:
      return MaterialPageRoute(builder: (context) => ForgetPasswordViwe());

    case HomeMainView.id:
      return MaterialPageRoute(builder: (context) => HomeMainView());
    case Factory.route:
      return MaterialPageRoute(builder: (context) => const Factory());
    case BestSellerViwe.id:
      return MaterialPageRoute(builder: (context) => const BestSellerViwe());

    case HomeProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeProductsView());

    case ProductCart.routeName:
      return MaterialPageRoute(builder: (context) => const ProductCart());

    case UserProfile.routeName:
      return MaterialPageRoute(builder: (context) => const UserProfile());
    default:
      return null;
  }
}
