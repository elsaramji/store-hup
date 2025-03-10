// components/chackout/view/widgets/icons_steps.dart
import 'package:flutter/material.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

// ignore: must_be_immutable
class StepsIconsBulider extends StatelessWidget {
  final List<String> titel;
  int widget_index = 0;
  StepsIconsBulider(
      {super.key, required this.titel, required this.widget_index});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(titel.length, (index) {
              return index <= widget_index
                  ? ActiveStepIcon(title: titel[index])
                  : InActiveStepIcon(title: titel[index], index: index + 1);
            })));
  }
}

class InActiveStepIcon extends StatelessWidget {
  final String title;
  final int index;
  const InActiveStepIcon({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.white,
          child: Text(
            index.toString(),
            style:
                TextsStyle.semibold13.copyWith(color: AppColors.grayscale950),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextsStyle.bold13.copyWith(color: const Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}

class ActiveStepIcon extends StatelessWidget {
  final String title;

  const ActiveStepIcon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextsStyle.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
