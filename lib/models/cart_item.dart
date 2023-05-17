// To parse this JSON data, do
//
//     final cartItems = cartItemsFromJson(jsonString);

import 'dart:convert';

CartItems cartItemsFromJson(String str) => CartItems.fromJson(json.decode(str));

String cartItemsToJson(CartItems data) => json.encode(data.toJson());

class CartItems {
  List<CartItem> cartItems;

  CartItems({
    this.cartItems,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
    cartItems: List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
  };
}

class CartItem {
  int id;
  int userId;
  int productId;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  CartItem({
    this.id,
    this.userId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "quantity": quantity,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
