class NewsModel {
  final String newsSource;
  final String headline;
  final String? content;
  final String time;
  final String? imageUrl;
  final String newsUrl;

  NewsModel({
    required this.newsSource,
    required this.headline,
    required this.content,
    required this.time,
    required this.imageUrl,
    required this.newsUrl,
  });
}
