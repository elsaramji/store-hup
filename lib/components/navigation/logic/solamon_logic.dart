// components/navigation/logic/solamon_logic.dart
import 'package:store_hup/components/cart/views/product_cart_main_view.dart';

import '../../Home/views/home_view.dart';
import '../../Home/views/home_view_body.dart';
import '../../products/view/home_products_view.dart';
import '../../profile/views/user_profile_main_view.dart';

class SolamonLogic {
  static void bodybuilder(int index, HomeMainView widget) {
    switch (index) {
      case 0:
        widget.body = HomeViwebody();

      case 1:
        widget.body = const HomeProductsView();

      case 2:
        widget.body = ProductCartMainView();

      case 3:
        widget.body = const UserProfile();
    }
  }
}
