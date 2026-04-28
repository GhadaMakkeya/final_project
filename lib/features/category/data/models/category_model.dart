class CategoryModel{
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


}