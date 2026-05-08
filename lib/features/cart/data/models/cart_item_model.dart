class CartItemModel {
  final String itemId, productName, productCoverUrl;
  final double finalPricePerUnit, totalPrice;
  int quantity;

  CartItemModel({
    required this.itemId,
    required this.productName,
    required this.productCoverUrl,
    required this.finalPricePerUnit,
    required this.totalPrice,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['itemId'],
      productName: json['productName'],
      productCoverUrl: json['productCoverUrl'],
      finalPricePerUnit: (json['finalPricePerUnit'] as num).toDouble() > 0
    ? (json['finalPricePerUnit'] as num).toDouble()
    : (json['basePricePerUnit'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      quantity: int.parse(json['quantity'].toString()),
    );
  }
}
