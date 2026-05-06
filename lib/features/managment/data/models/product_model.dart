class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int stock;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.stock,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'No Name',
      description: json['description']?.toString() ?? '',
      // الحل لمشكلة الـ No host هو التأكد من وجود http
      imageUrl: (json['coverPictureUrl'] != null && json['coverPictureUrl'].toString().contains('http'))
          ? json['coverPictureUrl']
          : 'https://via.placeholder.com/150', 
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] as int? ?? 0,
      category: (json['categories'] != null && (json['categories'] as List).isNotEmpty)
          ? json['categories'][0].toString()
          : 'General',
    );
  }

}



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