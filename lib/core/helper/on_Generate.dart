// core/helper/on_Generate.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/cart/views/product_cart_main_view.dart';
import 'package:store_hup/components/futures/Auth/forgetpassword/view/forget_password_viwe.dart';
import 'package:store_hup/components/futures/Auth/signin/views/Signin.dart';
import 'package:store_hup/components/futures/Auth/signup/view/signup_view_builder.dart';
import 'package:store_hup/components/products/view/home_products_view.dart';
import 'package:store_hup/components/profile/views/user_oder_viwe.dart';
import 'package:store_hup/components/profile/views/user_profile_edit_viwe.dart';
import 'package:store_hup/components/profile/views/user_profile_main_view.dart';

import '../../components/Home/views/best_seller_viwe.dart';
import '../../components/Home/views/home_view.dart';
import '../../components/factory/factory_tast.dart';
import '../../components/futures/onboarding/view/bording_view.dart';

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
