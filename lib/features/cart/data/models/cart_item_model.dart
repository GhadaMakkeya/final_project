class CartItemModel {
  final String name, subtitle, image;
  final double price;
  int quantity;

  CartItemModel({
    required this.name,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.quantity,
  });
}