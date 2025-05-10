// features/chackout/core/model/ordermodel.dart
import '../../../../features/cart/core/models/cart_item_entity.dart';

class OrderModel {
  String? id;
  String uid;
  final List<CartItemEntity>? cartItems;
  final String? address;
  final String? floor;
  final String? phone;
  final String? email;
  final String? name;
  bool paymentOnline;
  bool isChacked;
  bool isDelivered;
  bool isCanceled;
  bool isRefunded;

  OrderModel({
    this.id,
    this.cartItems,
    this.address,
    this.floor,
    this.phone,
    this.email,
    this.name,
    required this.uid,
    this.paymentOnline = false,
    this.isChacked = false,
    this.isDelivered = false,
    this.isCanceled = false,
    this.isRefunded = false,
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
        'isChacked': isChacked,
        'isDelivered': isDelivered,
        'isCanceled': isCanceled,
        'isRefunded': isRefunded,
        'uid': uid,
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
        isChacked: map['isChacked'],
        isDelivered: map['isDelivered'],
        isCanceled: map['isCanceled'],
        isRefunded: map['isRefunded'],
        uid: map['uid'],
      );
}
