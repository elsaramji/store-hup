// components/futures/onboarding/view/view_main.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/onboarding/view/view_one.dart';
import 'package:store_hup/components/futures/onboarding/view/view_tow.dart';

import '../widgets/dots.dart';
import '../widgets/startnow_button.dart';

class MainBoards extends StatefulWidget {
  static const String route = "/onBoarding";
  const MainBoards({super.key});

  @override
  State<MainBoards> createState() => _MainBoardsState();
}

class _MainBoardsState extends State<MainBoards> {
  late PageController pageController;
  int curnetpage = 0;
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      curnetpage = pageController.page!.round();
      setState(() {
        curnetpage = pageController.page!.round();
      });
    });
    super.initState();
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [const BoardOne(), const BoardTow()],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DotsPage(curnetpage: curnetpage),
          const SizedBox(
            height: 16,
          ),
          StartUpButton(curnetpage: curnetpage),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
