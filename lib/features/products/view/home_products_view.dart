// features/products/view/home_products_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../features/product_details_view/product_grid_view.dart';
import '../../../features/products/state_management/get_product_cubit.dart';
import '../../../features/products/widget/products_tap/scrrolled_products%20_bar.dart';
import '../../../core/custom/widgets/CustomHome/custom_prodcut_searchbar.dart';
import '../../../core/custom/widgets/alert_error.dart';
import '../../../core/assets/assets_image.dart';
import '../../../core/custom/widgets/CustomHome/custom_Page_Appbar.dart';
import '../../../core/styles/color_style.dart';
import '../../../core/styles/font_style.dart';

class HomeProductsView extends StatelessWidget {
  const HomeProductsView({super.key});
  static const String routeName = 'HomeProductsView';

  @override
  Widget build(BuildContext context) {
    // app bar title
    //serch text field
    //custom vertical list of products
    //best selling products
    return BlocProvider(
      create: (context) => GetProductCubit(),
      child: Builder(builder: (context) {
        context.read<GetProductCubit>().getProduct();
        return BlocBuilder<GetProductCubit, GetProductState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SafeArea(
                child: CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                    child: CustomPageAppbar(
                      pagetitel: "المنتجات",
                      arrowback: false,
                    ),
                  ),
                  const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 16)),
                  CustomProductSearchBar(onChanged: (value) {}),
                  const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 4)),
                  state is GetProductSuccess
                      ? ScrolledProductsBar(
                          snapshot: state.products,
                        )
                      : const SliverToBoxAdapter(
                          child: SizedBox(height: 0),
                        ),
                  const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 8)),
                  state is GetProductLoading
                      ? const SliverFillRemaining(
                          child: Center(
                            child: SpinKitFadingCircle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      : state is GetProductSuccess
                          ? ProductGrid(products: state.products)
                          : const AlertError()
                ]),
              ),
            );
          },
        );
      }),
    );
  }
}

class ProductsSortBar extends StatelessWidget {
  const ProductsSortBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        "منتجاتنا",
        style: TextsStyle.bold19.copyWith(color: AppColors.grayscale950),
      ),
      const Spacer(),
      Image.asset(
        Assets.assetsImagesArrowSwap,
        height: 24,
        width: 24,
      ),
    ]);
  }
}
