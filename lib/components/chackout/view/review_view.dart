// components/chackout/view/review_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/components/chackout/core/model/ordermodel.dart';
import 'package:store_hup/components/chackout/core/services/order_repo.dart';
import 'package:store_hup/components/chackout/view/edit_divider.dart';
import 'package:store_hup/components/chackout/view/widgets/delivery_data.dart';
import 'package:store_hup/components/chackout/view/widgets/order_payment_data.dart';
import 'package:store_hup/components/chackout/view/widgets/payment_data.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/service/database/presence.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: FutureBuilder(
          future: context
              .read<OrderRepo>()
              .firebase_collaction
              .doc(Preferences.getStringfromShared("orderId"))
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              OrderModel orderModel = OrderModel.fromMap(data);
              double totelCart = 0;

              orderModel.cartItems!.forEach(
                (element) {
                  totelCart += double.parse(element.product.price) *
                      double.parse(element.count.toString());
                },
              );
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 16,
                    children: [
                      Orderpaydata(
                          orderModel: orderModel, totelCart: totelCart),
                      const Paymentdata(),
                      const EditDivder(title: "معلومات التوصيل"),
                      Deliverydata(orderModel: orderModel),
                    ]),
              );
            } else {
              return const Center(
                child: SpinKitPianoWave(
                  color: AppColors.green1700,
                ),
              );
            }
          }),
    );
  }
}




