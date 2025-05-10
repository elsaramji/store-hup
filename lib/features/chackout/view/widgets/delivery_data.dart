// features/chackout/view/widgets/delivery_data.dart
import 'package:flutter/material.dart';
import '../../../../features/chackout/core/model/ordermodel.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';

class Deliverydata extends StatelessWidget {
  const Deliverydata({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          spacing: 8,
          children: [
            const Icon(Icons.person),
            Text(
              orderModel.name!,
              style: TextsStyle.regular13,
            ),
            const Spacer(),
            const Icon(Icons.phone),
            Text(orderModel.phone!)
          ],
        ),
        Row(
          spacing: 8,
          children: [
            const Icon(
              Icons.location_on_outlined,
            ),
            Text(
              orderModel.address!,
              style:
                  TextsStyle.regular16.copyWith(color: AppColors.grayscale600),
            ),
            const Spacer(),
            const Icon(Icons.home),
            Text(orderModel.floor!)
          ],
        ),
      ],
    );
  }
}
