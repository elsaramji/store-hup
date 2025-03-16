// components/chackout/core/model/ordermodel.dart
import 'package:store_hup/components/cart/core/models/cart_item_entity.dart';

class OrderModel {
  String? id;
  final List<CartItemEntity>? cartItems;
  final String? address;
  final String? floor;
  final String? phone;
  final String? email;
  final String? name;
  bool? paymentOnline;

  OrderModel({
    this.id,
    this.cartItems,
    this.address,
    this.floor,
    this.phone,
    this.email,
    this.name,
    this.paymentOnline = false,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'cartItems': cartItems?.map((x) => x.toMap()).toList(),
        'address': address,
        'phone': phone,
        'email': email,
        'name': name,
        'floor': floor,
        'paymentOnline': paymentOnline,
      };

  factory OrderModel.fromMap(Map<String, dynamic> map) => OrderModel(
        id: map['id'],
        cartItems: List<CartItemEntity>.from(
            map['cartItems']?.map((x) => CartItemEntity.fromMap(x))),
        address: map['address'],
        phone: map['phone'],
        email: map['email'],
        name: map['name'],
        floor: map['floor'],
        paymentOnline: map['paymentOnline'],
      );
}
