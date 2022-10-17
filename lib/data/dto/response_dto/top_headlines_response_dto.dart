import 'package:news_bloc/domain/models/news_model.dart';

class TopHeadlinesResponseDto {
  late final String? status;
  late final String? message;
  late final int totalResults;
  late final List<Article> articles;

  TopHeadlinesResponseDto(
      {required this.status,
      required this.totalResults,
      required this.articles});

  TopHeadlinesResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalResults = json['totalResults'];
    articles = (json['articles'] as List<dynamic>)
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  List<NewsModel> getNewsList() {
    final newsList = articles.map((e) => NewsModel(
        newsSource: e.source.name,
        headline: e.title,
        content: e.content,
        time: e.getTimeInAgo(),
        imageUrl: e.urlToImage,
        newsUrl: e.url));
    return newsList.toList();
  }
}

class Article {
  late final String title;
  late final String publishedAt;
  late final String? urlToImage;
  late final Source source;
  late final String? content;
  late final String url;

  Article(
      {required this.title,
      required this.publishedAt,
      required this.urlToImage,
      required this.source,
      required this.content,
      required this.url});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    publishedAt = json['publishedAt'];
    urlToImage = json['urlToImage'];
    source = Source.fromJson(json['source']);
    content = json['content'];
    url = json['url'];
  }

  String getTimeInAgo() {
    Duration diff = DateTime.now().difference(DateTime.parse(publishedAt));
    if (diff.inDays > 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays == 1) {
      return '${diff.inDays} day ago';
    } else if (diff.inHours > 1) {
      return '${diff.inHours} hours ago';
    } else if (diff.inHours == 1) {
      return '${diff.inHours} hour ago';
    } else if (diff.inMinutes > 1) {
      return '${diff.inMinutes} mins ago';
    } else if (diff.inMinutes == 1) {
      return '${diff.inMinutes} min ago';
    } else if (diff.inSeconds > 1) {
      return '${diff.inSeconds} seconds ago';
    } else {
      return 'just now';
    }
  }
}

class Source {
  late final String name;

  Source({required this.name});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
