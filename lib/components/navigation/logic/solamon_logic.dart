// components/navigation/logic/solamon_logic.dart
import 'package:store_hup/components/cart/views/product_cart_main_view.dart';

import '../../Home/views/home_view.dart';
import '../../Home/views/home_view_body.dart';
import '../../products/view/home_products_view.dart';
import '../../profile/user_profile.dart';

class SolamonLogic {
  static void bodybuilder(int index, HomeMainView widget) {
    switch (index) {
      case 0:
        widget.body = const HomeViwebody();

      case 1:
        widget.body = const HomeProductsView();

      case 2:
        widget.body = ProductCartMainView();

      case 3:
        widget.body = const UserProfile();
    }
  }
}
    /*
    static void generatorWithIndex(int index) async {
    await Future.delayed(Duration(milliseconds: 200));
    switch (index) {
      case 0:
        goToWithAnmation(page: HomeView());
        break;
      case 1:
        goToWithAnmation(page: HomeProductsView());
        break;
      case 2:
        goToWithAnmation(page: ProductCart());
        break;
      case 3:
        goToWithAnmation(page: UserProfile());
        break;
    }
  }

  static void goToWithAnmation({required Widget page}) {
    Get.off(page,
        transition: Transition.leftToRight,
        duration: Duration(milliseconds: 700));
  }*/

