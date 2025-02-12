class CollectionDetail {
  final String id;
  final String name;
  final String old;
  final String imageUrl;
  final Map<String, String> detail;
  final Map<String, String> tastingNotes;
  final String history;

  CollectionDetail({
    required this.id,
    required this.name,
    required this.old,
    required this.imageUrl,
    required this.detail,
    required this.tastingNotes,
    required this.history,
  });

  factory CollectionDetail.fromJson(Map<String, dynamic> json) {
    return CollectionDetail(
      id: json['id'],
      name: json['name'],
      old: json['old'],
      imageUrl: json['imageUrl'],
      detail: Map<String, String>.from(json['detail']),
      tastingNotes: Map<String, String>.from(json['tastingNotes']),
      history: json['history'],
    );
  }
}
