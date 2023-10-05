class Photo {
  final String url;
  final String id;
  final String title;
  final DateTime uploadDate;

  Photo({
    required this.url,
    required this.title,
    required this.uploadDate,
    required this.id,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      url: json['url'] ?? '',
      title: json['title'] ?? '',
      uploadDate: DateTime.parse(json['uploadDate'] ?? ''),
      id: json['id'] ?? '',
    );
  }
}
