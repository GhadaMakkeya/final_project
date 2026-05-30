class CategoryModel {
  final String id;

  final String name;

  final String description;

  final String coverPictureUrl;

  final double price;

  final bool isNew;

  CategoryModel({
    required this.id,

    required this.name,

    required this.description,

    required this.coverPictureUrl,

    required this.price,

    required this.isNew,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      coverPictureUrl: json['coverPictureUrl']?.toString() ?? '',
      price: generateFakePrice(),
      isNew: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "coverPictureUrl": coverPictureUrl,
      "price": price,
      "isNew": isNew,
    };
  }

  static double generateFakePrice() {
    List<double> prices = [650, 890, 1250, 2100, 3400, 4800];
    prices.shuffle();
    return prices.first;
  }
}
