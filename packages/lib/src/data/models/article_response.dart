// To parse this JSON data, do
//
//     final articleResponse = articleResponseFromMap(jsonString);

import 'dart:convert';

class ArticleResponse {
  ArticleResponse({
    required this.status,
    required this.totalHits,
    required this.page,
    required this.totalPages,
    required this.pageSize,
    required this.articles,
    required this.userInput,
  });

  final String status;
  final int totalHits;
  final int page;
  final int totalPages;
  final int pageSize;
  final List<Article> articles;
  final UserInput userInput;

  ArticleResponse copyWith({
    String? status,
    int? totalHits,
    int? page,
    int? totalPages,
    int? pageSize,
    List<Article>? articles,
    UserInput? userInput,
  }) =>
      ArticleResponse(
        status: status ?? this.status,
        totalHits: totalHits ?? this.totalHits,
        page: page ?? this.page,
        totalPages: totalPages ?? this.totalPages,
        pageSize: pageSize ?? this.pageSize,
        articles: articles ?? this.articles,
        userInput: userInput ?? this.userInput,
      );

  factory ArticleResponse.fromJson(String str) =>
      ArticleResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleResponse.fromMap(Map<String, dynamic> json) => ArticleResponse(
        status: json["status"],
        totalHits: json["total_hits"],
        page: json["page"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
        userInput: UserInput.fromMap(json["user_input"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "total_hits": totalHits,
        "page": page,
        "total_pages": totalPages,
        "page_size": pageSize,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
        "user_input": userInput.toMap(),
      };
}

class Article {
  Article({
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.publishedDatePrecision,
    required this.link,
    required this.cleanUrl,
    required this.summary,
    required this.rights,
    required this.rank,
    required this.topic,
    required this.country,
    required this.language,
    required this.authors,
    required this.media,
    required this.isOpinion,
    required this.twitterAccount,
    required this.score,
    required this.id,
  });

  final String title;
  final dynamic author;
  final DateTime publishedDate;
  final String publishedDatePrecision;
  final String link;
  final String cleanUrl;
  final String summary;
  final String rights;
  final int rank;
  final String topic;
  final String country;
  final String language;
  final List<dynamic> authors;
  final String media;
  final bool isOpinion;
  final String twitterAccount;
  final double score;
  final String id;

  Article copyWith({
    String? title,
    dynamic author,
    DateTime? publishedDate,
    String? publishedDatePrecision,
    String? link,
    String? cleanUrl,
    String? summary,
    String? rights,
    int? rank,
    String? topic,
    String? country,
    String? language,
    List<dynamic>? authors,
    String? media,
    bool? isOpinion,
    String? twitterAccount,
    double? score,
    String? id,
  }) =>
      Article(
        title: title ?? this.title,
        author: author ?? this.author,
        publishedDate: publishedDate ?? this.publishedDate,
        publishedDatePrecision:
            publishedDatePrecision ?? this.publishedDatePrecision,
        link: link ?? this.link,
        cleanUrl: cleanUrl ?? this.cleanUrl,
        summary: summary ?? this.summary,
        rights: rights ?? this.rights,
        rank: rank ?? this.rank,
        topic: topic ?? this.topic,
        country: country ?? this.country,
        language: language ?? this.language,
        authors: authors ?? this.authors,
        media: media ?? this.media,
        isOpinion: isOpinion ?? this.isOpinion,
        twitterAccount: twitterAccount ?? this.twitterAccount,
        score: score ?? this.score,
        id: id ?? this.id,
      );

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        title: json["title"],
        author: json["author"],
        publishedDate: DateTime.parse(json["published_date"]),
        publishedDatePrecision: json["published_date_precision"],
        link: json["link"],
        cleanUrl: json["clean_url"],
        summary: json["summary"],
        rights: json["rights"],
        rank: json["rank"],
        topic: json["topic"],
        country: json["country"] == null ? null : json["country"],
        language: json["language"],
        authors: List<dynamic>.from(json["authors"].map((x) => x)),
        media: json["media"],
        isOpinion: json["is_opinion"],
        twitterAccount: json["twitter_account"],
        score: json["_score"].toDouble(),
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "author": author,
        "published_date": publishedDate.toIso8601String(),
        "published_date_precision": publishedDatePrecision,
        "link": link,
        "clean_url": cleanUrl,
        "summary": summary,
        "rights": rights,
        "rank": rank,
        "topic": topic,
        "country": country == null ? null : country,
        "language": language,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "media": media,
        "is_opinion": isOpinion,
        "twitter_account": twitterAccount,
        "_score": score,
        "_id": id,
      };
}

class UserInput {
  UserInput({
    required this.q,
    required this.lang,
    required this.from,
    required this.sortBy,
    required this.page,
    required this.size,
  });

  final String q;
  final String lang;
  final DateTime from;
  final String sortBy;
  final int page;
  final int size;

  UserInput copyWith({
    String? q,
    String? lang,
    DateTime? from,
    String? sortBy,
    int? page,
    int? size,
  }) =>
      UserInput(
        q: q ?? this.q,
        lang: lang ?? this.lang,
        from: from ?? this.from,
        sortBy: sortBy ?? this.sortBy,
        page: page ?? this.page,
        size: size ?? this.size,
      );

  factory UserInput.fromJson(String str) => UserInput.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserInput.fromMap(Map<String, dynamic> json) => UserInput(
        q: json["q"],
        lang: json["lang"],
        from: DateTime.parse(json["from"]),
        sortBy: json["sort_by"],
        page: json["page"],
        size: json["size"],
      );

  Map<String, dynamic> toMap() => {
        "q": q,
        "lang": lang,
        "from": from.toIso8601String(),
        "sort_by": sortBy,
        "page": page,
        "size": size,
      };
}
