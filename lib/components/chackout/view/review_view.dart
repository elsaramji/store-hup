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
import 'package:store_hup/core/styles/font_style.dart';
import 'package:store_hup/service/database/presence.dart';

class Resete extends StatelessWidget {
  const Resete({super.key});

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
                      Row(
                        children: [
                          Expanded(
                              child:
                                  Text("المنتجات", style: TextsStyle.bold16)),
                          const Spacer(),
                          Expanded(
                              child: Text("الكمية", style: TextsStyle.bold16)),
                          const Spacer(),
                          Expanded(
                              child: Text("السعر", style: TextsStyle.bold16)),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: orderModel.cartItems!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                    orderModel.cartItems![index].product.name,
                                    style: TextsStyle.regular16.copyWith(
                                        color: AppColors.grayscale950)),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Text(
                                    orderModel.cartItems![index].count
                                        .toString(),
                                    style: TextsStyle.regular16.copyWith(
                                        color: AppColors.grayscale950)),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Text(
                                    orderModel.cartItems![index].product.price,
                                    style: TextsStyle.regular16.copyWith(
                                        color: AppColors.grayscale950)),
                              ),
                            ],
                          );
                        },
                      ),
                      Orderpaydata(
                          orderModel: orderModel, totelCart: totelCart),
                      Paymentdata(
                        isOnline: orderModel.paymentOnline,
                      ),
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
