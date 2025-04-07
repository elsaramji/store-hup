// components/Home/views/home_view_body.dart
// components/Home/views/home_view_body.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_hup/components/product_details_view/product_grid_view.dart';
import 'package:store_hup/components/products/state_management/get_product_cubit.dart';
import 'package:store_hup/core/custom/widgets/alert_error.dart';
import 'package:store_hup/core/injection/Git_it.dart';
import 'package:store_hup/core/injection/firebase/auth/auth_service.dart';
import 'package:store_hup/core/models/user_entity.dart';
import 'package:store_hup/core/styles/color_style.dart';
import 'package:store_hup/service/database/presence.dart';

import '../../../core/custom/widgets/custom_prodcut_searchbar.dart';
import '../custom/widgets/custom_bast_seller.dart';
import '../custom/widgets/custom_home_appbar.dart';
import '../widgets/offers/offers_widget.dart';

class HomeViwebody extends StatelessWidget {
  HomeViwebody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // get user model from hive

    return BlocProvider(
      create: (context) => GetProductCubit(),
      child: Builder(
        builder: (context) {
          context.read<GetProductCubit>().getProduct();
          Usermodel usermodel = Usermodel.fromMap(jsonDecode(
              Preferences.getStringfromShared(
                      getIt<FirebaseAuthService>().getUserId()) ??
                  '{}'));
          ;
          return BlocBuilder<GetProductCubit, GetProductState>(
            builder: (context, state) {
              return SafeArea(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: CustomScrollView(slivers: [
                      const SliverToBoxAdapter(child: SizedBox(height: 16)),
                      CustomHomeAppBar(
                        userName: "${usermodel.name}",
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 12)),
                      CustomProductSearchBar(
                        onChanged: (value) {},
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 12)),
                      // body Section
                      // offers
                      SliverToBoxAdapter(
                          child: AspectRatio(
                        aspectRatio: 342 / 158,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => const OffersItem(),
                          itemCount: 5,
                        ),
                      )),
                      //bast seller
                      const BastSellerBar(),
                      // Products
                      state is GetProductLoading
                          ? const SliverFillRemaining(
                              child: Center(
                                  child: SpinKitChasingDots(
                                color: AppColors.green1600,
                              )),
                            )
                          : state is GetProductSuccess
                              ? ProductGrid(
                                  products: state.products,
                                )
                              : const AlertError(),
                    ])),
              );
            },
          );
        },
      ),
    );
  }
}
