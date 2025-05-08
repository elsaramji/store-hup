abstract class UserEntity {
  final String? id;
  final String name;
  final String email;
  final String? phone;
  final String? imageUrl;
  final List<dynamic>? favorite;
  final List<dynamic>? cart;
  final List<dynamic>? orders;
  final List<dynamic>? address;
  final String? token;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    this.phone,
    this.imageUrl,
    this.favorite,
    this.cart,
    this.orders,
    this.address,
    this.token,
  });
}
