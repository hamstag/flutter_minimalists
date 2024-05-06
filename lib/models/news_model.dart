class NewsModel {
  final String id;
  final String title;

  NewsModel({
    required this.id,
    required this.title,
  });

  static NewsModel fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'].toString(),
      title: map['title'].toString(),
    );
  }
}
