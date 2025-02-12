class CollectionItem {
  final String name;
  final int year;
  final String id;
  final String available;
  final String imageUrl;

  CollectionItem({
    required this.name,
    required this.year,
    required this.id,
    required this.available,
    required this.imageUrl,
  });

  factory CollectionItem.fromJson(Map<String, dynamic> json) {
    return CollectionItem(
      name: json['name'],
      year: json['year'],
      id: json['id'],
      available: json['available'],
      imageUrl: json['imageUrl'],
    );
  }
}
