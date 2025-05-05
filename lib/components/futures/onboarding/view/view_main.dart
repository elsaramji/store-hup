// components/futures/onboarding/view/view_main.dart
import 'package:flutter/material.dart';
import 'package:store_hup/components/futures/onboarding/view/view_one.dart';
import 'package:store_hup/components/futures/onboarding/view/view_tow.dart';
import 'package:store_hup/core/constant/context_value.dart';

import '../widgets/dots.dart';
import '../widgets/startnow_button.dart';

class OnboardView extends StatefulWidget {
  static const String route = "/onBoarding";
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
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
/*************  ✨ Windsurf Command ⭐  *************/
  /// The build method of [OnboardView] which is a [StatefulWidget].
  ///
  /// It returns a [Scaffold] widget with a [SizedBox] as its body. The
  /// [SizedBox] is the size of the screen and contains a [Column] with
  /// a [PageView] as the first child and a [DotsPage] and a [StartUpButton]
  /// as the second and third children, respectively.
  ///
  /// The [PageView] displays the two onboarding screens and the [DotsPage]
  /// displays the dots that indicate which screen is currently displayed.
  /// The [StartUpButton] is a button that is displayed at the bottom of the
  /// screen and is used to start the app.
  ///
/*******  4d624eba-c465-4b95-8756-80857cea7caf  *******/ Widget build(
      BuildContext context) {
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
