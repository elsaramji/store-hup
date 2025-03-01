// components/chackout/view/chack_out_main_view.dart

import 'package:flutter/material.dart';
import 'package:store_hup/components/chackout/core/constant/const_var.dart';
import 'package:store_hup/components/chackout/view/widgets/trans_button.dart';
import 'package:store_hup/components/chackout/view/widgets/icons_steps.dart';
import 'package:store_hup/components/chackout/view/widgets/page_steps.dart';

// ignore: must_be_immutable
class ChackOutMainView extends StatefulWidget {
  late PageController controller;
  int index = 0;
  static const String routeName = '/ChackOutMainView';
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
    return Scaffold(
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
    );
  }
}

