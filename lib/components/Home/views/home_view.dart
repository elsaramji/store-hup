// components/Home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/Home/views/home_view_body.dart';
import 'package:store_hup/components/navigation/logic/solamon_logic.dart';
import 'package:store_hup/components/navigation/view/solamon_navigation_bar.dart';

// ignore: must_be_immutable
class HomeMainView extends StatefulWidget {
  static const String id = 'HomeView';
  int _selectedIndex = 0;
  Widget body = const HomeViwebody();
  HomeMainView({super.key});
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
    return Scaffold(
        body: widget.body, bottomNavigationBar: solamonNavigationBar);
  }
}
