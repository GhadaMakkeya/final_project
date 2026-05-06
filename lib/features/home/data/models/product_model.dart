class ProductModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int stock;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.stock,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'No Name',
      description: json['description']?.toString() ?? '',
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