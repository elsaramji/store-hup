// core/helper/on_Generate.dart


import 'package:flutter/material.dart';
import '../../features/Auth/presentetion/views/forget_password_viwe.dart';
import '../../features/Auth/presentetion/views/signin_view.dart';
import '../../features/Auth/presentetion/views/signup_view.dart';
import '../../features/Home/views/best_seller_viwe.dart';
import '../../features/Home/views/home_view.dart';
import '../../features/cart/views/product_cart_main_view.dart';
import '../../features/factory/factory_tast.dart';
import '../../features/onboarding/view/bording_view.dart';
import '../../features/products/view/home_products_view.dart';
import '../../features/profile/views/user_oder_viwe.dart';
import '../../features/profile/views/user_profile_edit_viwe.dart';
import '../../features/profile/views/user_profile_main_view.dart';

Route<dynamic>? ongenerate(RouteSettings setting) {
  switch (setting.name) {
    case OnboardView.route:
      return MaterialPageRoute(builder: (context) => const OnboardView());

    case Signin.route:
      return MaterialPageRoute(builder: (context) => const Signin());

    case SignupMainviwe.route:
      return MaterialPageRoute(builder: (context) =>  SignupMainviwe());

    case ForgetPasswordViwe.route:
      return MaterialPageRoute(builder: (context) => ForgetPasswordViwe());

    case HomeMainView.route:
      return MaterialPageRoute(builder: (context) => HomeMainView());
    case Factory.route:
      return MaterialPageRoute(builder: (context) => const Factory());
    case BestSellerViwe.id:
      return MaterialPageRoute(builder: (context) => const BestSellerViwe());

    case HomeProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeProductsView());

    case ProductCartMainView.routeName:
      return MaterialPageRoute(builder: (context) => ProductCartMainView());

    case UserProfile.routeName:
      return MaterialPageRoute(builder: (context) => const UserProfile());
    case UserProfileEditView.routeName:
      return MaterialPageRoute(builder: (context) => UserProfileEditView());
    case UserOderViwe.routeName:
      return MaterialPageRoute(builder: (context) => UserOderViwe());
    default:
      return null;
  }
}
