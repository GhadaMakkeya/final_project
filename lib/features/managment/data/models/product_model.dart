class ProductModel {
  final List<String> categoryIds;
  final String color;
  final String coverPictureUrl;
  final String description;
  final String descriptionArabic;
  final int discountPercentage;
  final String name;
  final String nameArabic;
  final double price;
  final String sellerId;
  final int stock;
  final double weight;

  ProductModel({
    required this.categoryIds,
    required this.color,
    required this.coverPictureUrl,
    required this.description,
    required this.descriptionArabic,
    required this.discountPercentage,
    required this.name,
    required this.nameArabic,
    required this.price,
    required this.sellerId,
    required this.stock,
    required this.weight,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryIds: List<String>.from(json['categoryIds'] ?? []),
      color: json['color'] ?? '',
      coverPictureUrl: json['coverPictureUrl'] ?? '',
      description: json['description'] ?? '',
      descriptionArabic: json['descriptionArabic'] ?? '',
      discountPercentage: (json['discountPercentage'] as num?)?.toInt() ?? 0,
      name: json['name'] ?? '',
      nameArabic: json['nameArabic'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      sellerId: json['sellerId'] ?? '',
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categoryIds": categoryIds,
      "color": color,
      "coverPictureUrl": coverPictureUrl,
      "description": description,
      "descriptionArabic": descriptionArabic,
      "discountPercentage": discountPercentage,
      "name": name,
      "nameArabic": nameArabic,
      "price": price,
      "sellerId": sellerId,
      "stock": stock,
      "weight": weight,
    };
  }
}