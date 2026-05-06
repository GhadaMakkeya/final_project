class CategoryModel {
  final String id;
  final String name;
  final String? description;
  final String? coverPictureUrl;
  final double price;

  var isNew;

  CategoryModel({
    required this.id,
    required this.name,
    this.description,
    this.coverPictureUrl,
    required this.price, required bool isNew,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'] ?? "",
      description: json['description'],
      coverPictureUrl: json['coverPictureUrl'],
      price: generateFakePrice(), // because api not have a price
      isNew: true,
    );
  }

  static double generateFakePrice() {
    List<double> prices = [650, 890, 1250, 2100, 3400, 4800];

    prices.shuffle();

    return prices.first;
  }
}
