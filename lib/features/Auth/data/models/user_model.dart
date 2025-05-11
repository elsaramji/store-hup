import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.name,
    required super.email,
    super.phone,
    super.favorite,
    super.cart,
    super.orders,
    super.address,
    super.token,
    super.imageUrl,
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
      imageUrl: json['imageUrl'] as String?,
    );
  }
  factory UserModel.toObject(UserEntity user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      favorite: user.favorite,
      cart: user.cart,
      orders: user.orders,
      address: user.address,
      token: user.token,
      imageUrl: user.imageUrl,
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
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
      id: user.uid,
      imageUrl: user.photoURL ?? 'No Image',
      phone: user.phoneNumber ?? 'No Phone',
    );
  }
}
