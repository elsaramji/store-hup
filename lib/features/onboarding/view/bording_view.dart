// features/onboarding/view/view_main.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../features/onboarding/data/bord_data.dart';
import '../../../features/onboarding/widgets/custom_boarding.dart';
import '../../../features/onboarding/widgets/onbording_background.dart';

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
      curnetpage = pageController.page!.toInt();
      setState(() {
        curnetpage = pageController.page!.toInt();
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
        body: Stack(
      children: [
        Positioned.fill(
          bottom: 0.407.sh,
          child: OnBordingBackground(index: curnetpage),
        ),
        PageView.builder(
          itemCount: BordData.pagesdata.length,
          pageSnapping: true,
          controller: pageController,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomBoard(
              subtitel: BordData.pagesdata[index].description,
              imagepath: BordData.pagesdata[index].image,
              curnetpage: curnetpage,
              title: BordData.pagesdata[index].title,
            );
          },
        )
      ],
    ));
  }
}
