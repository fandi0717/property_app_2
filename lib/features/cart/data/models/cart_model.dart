import '../../domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel(
      {required String data})
      : super(data: data);

  CartModel copyWith({
    String? data,
  }) {
    return CartModel(
      data: data ?? this.data  ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    data: json["data"],
  );
}

