class ProductModel {
  final String name;
  final String description;
  final String arabicName;
  final String arabicDescription;
  final double price;
  final int stock;
  final String coverPictureUrl;
  final List<String> categories; // مصفوفة أسماء الفئات

  ProductModel({
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.price,
    required this.stock,
    required this.coverPictureUrl,
    required this.categories,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "arabicName": arabicName,
      "arabicDescription": arabicDescription,
      "price": price,
      "stock": stock,
      "coverPictureUrl": coverPictureUrl,
      "categories": categories,
    };
  }
}