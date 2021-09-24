class NewsResponseModel {
  String? status;
  int? totalNews;
  List<NewsModel> newsList = [];

  NewsResponseModel({
    this.status,
    this.totalNews,
    this.newsList = const [],
  });

  NewsResponseModel.fromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.totalNews = json['totalResults'];
    if (json['articles'] != null) {
      newsList = [];
      json['articles'].forEach((v) {
        newsList.add(NewsModel.fromJson(v));
      });
    }
  }
}

class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? image;
  String? publishDate;
  String? content;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.image,
    this.publishDate,
    this.content,
    this.url,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    this.source = Source.fromJson(json['source']);
    this.author = json['author'];
    this.title = json['title'];
    this.description = json['description'];
    this.image = json['urlToImage'];
    this.publishDate = json['publishedAt'];
    this.content = json['content'];
    this.url = json['url'];
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }
}
