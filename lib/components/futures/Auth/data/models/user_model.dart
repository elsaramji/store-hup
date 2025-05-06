import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_hup/components/futures/Auth/domain/core_entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    super.favorite,
    super.cart,
    super.orders,
    super.address,
    super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      favorite: json['favorite'] as List<dynamic>?,
      cart: json['cart'] as List<dynamic>?,
      orders: json['orders'] as List<dynamic>?,
      address: json['address'] as List<dynamic>?,
      token: json['token'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'favorite': favorite,
      'cart': cart,
      'orders': orders,
      'address': address,
      'token': token,
    };
  }

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
      id: user.uid,
      phone: user.phoneNumber ?? 'No Phone',
    );
  }
}
