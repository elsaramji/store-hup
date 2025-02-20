// components/cart/views/product_cart_main_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/cart/core/services/firebase/data/cart_store_repo.dart';
import 'package:store_hup/components/cart/core/state_management/cart_state/cart_cubit.dart';
import 'package:store_hup/components/cart/views/widgets/cart_item.dart';
import 'package:store_hup/core/custom/widgets/CustomHome/custom_Page_Appbar.dart';
import 'package:store_hup/core/custom/widgets/alert_error.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/core/styles/font_style.dart';

class ProductCartMainView extends StatefulWidget {
  static const routeName = '/product-cart-main-view';

  ProductCartMainView({super.key});

  @override
  State<ProductCartMainView> createState() => _ProductCartMainViewState();
}

class _ProductCartMainViewState extends State<ProductCartMainView> {
  num pay = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CartCubit(cartStoreRepo: getIt<CartFirebaseRepo>()),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                      child: CustomPageAppbar(
                    pagetitel: "السلة",
                    notification: false,
                  )),
                  StreamBuilder(
                      stream: context.read<CartCubit>().getCart(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data!.docs.isNotEmpty) {
                          return SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Center(
                                    child: Text(
                                  "لديك ${snapshot.data!.docs.length} من المنتجات",
                                  style: TextsStyle.regular16
                                      .copyWith(color: AppColors.green700),
                                )),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return CartItem(
                                        cartItemEntity: CartItemEntity.fromMap(
                                            snapshot.data!.docs[index].data()
                                                as Map<String, dynamic>),
                                      );
                                    })
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const AlertError();
                        } else {
                          return SliverToBoxAdapter(
                              child: Container(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Center(
                              child: SpinKitChasingDots(
                                color: Colors.green,
                              ),
                            ),
                          ));
                        }
                      }),
                ]),
              ),
              Positioned(
                bottom: 17,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    titel: "استكمال الطلب",
                    onPressed: () {},
                    titelcolor: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
