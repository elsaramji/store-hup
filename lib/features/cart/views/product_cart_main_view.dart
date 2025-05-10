// features/cart/views/product_cart_main_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../features/cart/core/models/cart_item_entity.dart';
import '../../../features/cart/core/state_management/cart_state/cart_cubit.dart';
import '../../../features/cart/views/widgets/cart_item.dart';
import '../../../features/chackout/view/chack_out_main_view.dart';
import '../../../core/custom/widgets/alert_error.dart';
import '../../../core/custom/widgets/custom_button.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

// ignore: must_be_immutable
class ProductCartMainView extends StatefulWidget {
  static const routeName = '/product-cart-main-view';
  List<CartItemEntity> cartItems = [];
  int cartLength = 0;
  ProductCartMainView({
    super.key,
  });

  @override
  State<ProductCartMainView> createState() => _ProductCartMainViewState();
}

class _ProductCartMainViewState extends State<ProductCartMainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        Provider.value(value: widget.cartLength)
      ],
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  title: Text("سلة المشتريات", style: TextsStyle.bold16),
                  centerTitle: true,
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                ),
                StreamBuilder(
                    stream: context.read<CartCubit>().getCart(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        widget.cartLength = snapshot.data!.docs.length;
                        widget.cartItems = snapshot.data!.docs
                            .map((e) => CartItemEntity.fromMap(
                                e.data() as Map<String, dynamic>))
                            .toList();

                        return SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              const SizedBox(
                                height: 16,
                              ),
                              Center(
                                child: Text(
                                  "لديك ${snapshot.data!.docs.length} منتجات",
                                  style: TextsStyle.regular16
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 64),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return CartItem(
                                      cartItemEntity: CartItemEntity.fromMap(
                                          snapshot.data!.docs[index].data()
                                              as Map<String, dynamic>),
                                    );
                                  }),
                            ],
                          ),
                        );
                      }
                      if (snapshot.data != null &&
                          snapshot.data!.docs.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove_shopping_cart_outlined,
                                    color: AppColors.primaryColor,
                                    size: 100,
                                  ),
                                  Text("لا يوجد منتجات"),
                                  SizedBox(height: 100),
                                ],
                              ),
                            ),
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
                  onPressed: () {
                    Get.to(
                        ChackOutMainView(
                          cartItems: widget.cartItems,
                        ),
                        curve: Curves.easeIn);
                  },
                  titelcolor: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
