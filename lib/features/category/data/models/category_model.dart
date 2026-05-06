class CategoryModel {
  final String name;
  final String subtitle;
  final double price;
  final String image;
  final bool isFavorite;
  final bool isNew;

  CategoryModel({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    this.isFavorite = false,
    this.isNew = false,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      subtitle: json['subtitle'] ?? '',
      price: (json['price'] as num)
          .toDouble(), // عشان نضمن إنه ميضربش لو جه رقم صحيح
      image: json['image'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
      isNew: json['isNew'] ?? false,
    );
  }
}
