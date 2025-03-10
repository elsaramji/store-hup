// components/chackout/view/chack_out_main_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/chackout/core/constant/const_var.dart';
import 'package:store_hup/components/chackout/core/state_management/order_cubit.dart';
import 'package:store_hup/components/chackout/view/address_info_view.dart';
import 'package:store_hup/components/chackout/view/widgets/icons_steps.dart';
import 'package:store_hup/components/chackout/view/widgets/page_steps.dart';
import 'package:store_hup/components/chackout/view/widgets/trans_button.dart';

// ignore: must_be_immutable
class ChackOutMainView extends StatefulWidget {
  late PageController controller;
  final List<CartItemEntity> cartItems;
  int index = 0;
  static const String routeName = '/ChackOutMainView';

  ChackOutMainView({super.key, required this.cartItems});
  @override
  State<ChackOutMainView> createState() => _ChackOutMainViewState();
}

class _ChackOutMainViewState extends State<ChackOutMainView> {
  initState() {
    widget.controller = PageController();
    widget.controller.addListener(() {
      setState(() {
        widget.index = widget.controller.page!.toInt();
      });
    });
    super.initState();
  }

  dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: MultiProvider(
        providers: [
          Provider.value(value: widget.cartItems),
          Provider.value(value: AddressModel()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              titel()[widget.index],
            ),
          ),
          body: Column(
            children: [
              StepsIconsBulider(titel: titel(), widget_index: widget.index),
              PageOrderSteps(controller: widget.controller),
              TransButtonsBuilder(
                  controller: widget.controller, index: widget.index)
            ],
          ),
        ),
      ),
    );
  }
}
