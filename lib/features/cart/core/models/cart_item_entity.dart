// features/cart/core/models/cart_item_entity.dart
import '../../../../core/models/product.dart';

class CartItemEntity {
  final Product product;
  int count;
  CartItemEntity({
    required this.product,
    this.count = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'count': count,
    };
  }

  factory CartItemEntity.fromMap(Map<String, dynamic> map) {
    return CartItemEntity(
      product: Product.fromJson(map['product']),
      count: map['count'],
    );
  }

  num get total => double.parse(product.price) * count;
  String get code_item => product.id;
  increase() {
    count++;
  }

  decrease() {
    count > 0 ? count-- : count = 1;
  }
}
