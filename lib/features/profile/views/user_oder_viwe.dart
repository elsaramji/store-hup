import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../features/chackout/core/model/ordermodel.dart';
import '../../../features/profile/views/widgets/order_obsever.dart';
import '../../../core/assets/assets_image.dart';
import '../../../core/constant/end_points.dart';
import '../../../core/injection/Git_it.dart';
import '../../../core/injection/firebase/auth/auth_service.dart';
import '../../../core/styles/color_style.dart';

class UserOderViwe extends StatelessWidget {
  static const String routeName = '/userOrderView';
  final CollectionReference firebase_collaction_users = FirebaseFirestore
      .instance
      .collection(EndPoints.usersEndPoints)
      .doc(getIt<FirebaseAuthService>().getUserId())
      .collection('orders');

  UserOderViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلباتي'),
      ),
      body: StreamBuilder(
          stream: firebase_collaction_users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final OrderModel order = OrderModel.fromMap(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>);
                    return OrderItem(order: order);
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class OrderItem extends StatefulWidget {
  final OrderModel order;

  const OrderItem({super.key, required this.order});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.green50,
            child: SvgPicture.asset(
              Assets.assetsImagesOrdersvg,
            ),
          ),
          title: Text("طلب رقم ${widget.order.id}"),
          subtitle: Text('عدد المنتجات ${widget.order.cartItems!.length}'),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: SvgPicture.asset(
              Assets.assetsImagesArrowDown,
            ),
          ),
        ),
        OrderObsever(isExpanded: isExpanded, widget: widget),
      ],
    );
  }
}
