class CategoryModel {
  final String? id;
  final String name;
  final String description;
  final String coverPictureUrl;
  //bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    //this.isSelected = false,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      coverPictureUrl: json['coverPictureUrl']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "coverPictureUrl": coverPictureUrl,
    };
  }
}
