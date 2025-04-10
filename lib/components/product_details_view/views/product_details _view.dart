// components/product_details_view/views/product_details _view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';
import 'package:store_hup/components/cart/core/state_management/cart_state/cart_cubit.dart';
import 'package:store_hup/components/product_details_view/widgets/discretion_box.dart';
import 'package:store_hup/components/product_details_view/widgets/product_info_itmes.dart';
import 'package:store_hup/core/custom/widgets/custom_button.dart';
import 'package:store_hup/core/models/product.dart';

import '../../../../core/styles/color_style.dart';
import '../widgets/product_basic_info.dart';

class ProductDetailsView extends StatefulWidget {
  static String routeName = '/ProductDetailsView';
  final Product product;

  ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SafeArea(
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: ImagePorductInfo(product: widget.product),
                  ),
                  SliverToBoxAdapter(
                    child: BasicProductInfo(
                      product: widget.product,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DescriptionBox(product: widget.product),
                  ),
                  const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 16)),
                  SliverToBoxAdapter(
                    child: ProductInfoItems(product: widget.product),
                  ),
                  const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 32)),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      titel: "اضافة الى السلة",
                      onPressed: () {
                        // Add to cart logic here
                        context.read<CartCubit>().addToCart(
                            CartItemEntity(product: widget.product), context);
                        Navigator.pop(context);
                      },
                      titelcolor: AppColors.white,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
                ]),
              ),
            ));
      }),
    );
  }
}
