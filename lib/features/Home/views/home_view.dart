// features/Home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/Home/views/home_view_body.dart';
import '../../../features/cart/core/state_management/cart_state/cart_cubit.dart';
import '../../../features/navigation/logic/solamon_logic.dart';
import '../../../features/navigation/view/solamon_navigation_bar.dart';
import '../../../features/products/state_management/get_product_cubit.dart';

// ignore: must_be_immutable
class HomeMainView extends StatefulWidget {
  static const String route = '/home_view';
  int _selectedIndex = 0;
  Widget body = HomeViwebody();

  HomeMainView({
    super.key,
  }) {
    body = HomeViwebody();
  }
  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  Widget build(BuildContext context) {
    var solamonNavigationBar = SolamonNavigationBar(
      selectedIndex: widget._selectedIndex,
      onTap: (index) {
        setState(() {
          widget._selectedIndex = index;
        });
        SolamonLogic.bodybuilder(widget._selectedIndex, widget);
      },
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductCubit(),
        ),
      ],
      child: Scaffold(
          body: widget.body, bottomNavigationBar: solamonNavigationBar),
    );
  }
}
