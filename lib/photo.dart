class Photo {
  final String description;
  final String author;
  final String thumbUrl;
  final String smallUrl;
  final String fullUrl;

  Photo({this.description, this.author, this.thumbUrl, this.smallUrl, this.fullUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      description: json['description'] as String,
      author: json['user']['name'] as String,
      thumbUrl: json['urls']['thumb'] as String,
      smallUrl: json['urls']['small'] as String,
      fullUrl: json['urls']['full'] as String,
    );
  }
}