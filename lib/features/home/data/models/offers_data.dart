class OffersData {
  final String imagePath;
  final String offerTitle;
  final String offerDesc;

  OffersData({
    required this.imagePath,
    required this.offerTitle,
    required this.offerDesc,
  });
  factory OffersData.fromJson(Map<String, dynamic> json) {
    return OffersData(
      imagePath: json['coverUrl'] ?? '',
      offerTitle: json['name'] ?? '',
      offerDesc: json['description'] ?? '',
    );
  }
}
