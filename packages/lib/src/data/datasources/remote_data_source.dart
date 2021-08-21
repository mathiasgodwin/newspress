import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:errors/errors.dart';
import 'package:newspackage/src/data/models/article_response.dart';

///
abstract class IRemoteDataSource {
  Future<ArticleResponse>? getHeadLine(String? country, String? category);
  Future<ArticleResponse>? getSearch(String? q);
}

///
class RemoteDataSource implements IRemoteDataSource {
  RemoteDataSource({
    String? q,
    String? country,
    String? category,
  });

  String? q;
  String? country;
  String? category;
  final _client = Dio();

  @override
  Future<ArticleResponse>? getSearch(String? q) async {
     // ignore: lines_longer_than_80_chars
     const apikey = String.fromEnvironment('apiKey');
    try {
      final url = "https://free-news.p.rapidapi.com/v1/search?q=$q&lang=en";
      

      final result = await _client.fetch(
        RequestOptions(
            path: url,
            method: 'Get',
            responseType: ResponseType.json,
            headers: {
              "x-rapidapi-key": apikey,
              "x-rapidapi-host": "free-news.p.rapidapi.com"
            }),
      );

      if (result.statusCode == 200) {
        return ArticleResponse.fromJson(result.toString());
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  // ignore: lines_longer_than_80_chars
  Future<ArticleResponse>? getHeadLine(String? country, String? category) async {
    const apikey = String.fromEnvironment('apiKey');
    try {
      // ignore: unnecessary_brace_in_string_interps
      final url =
          "https://free-news.p.rapidapi.com/v1/search?topic=$category&lang=en";

      final result = await _client.fetch(
        RequestOptions(
            path: url,
            method: 'Get',
            responseType: ResponseType.json,
            headers: {
              "x-rapidapi-key": apikey,
              "x-rapidapi-host": "free-news.p.rapidapi.com"
            }),
      );

      if (result.statusCode == 200) {

        return ArticleResponse.fromJson(result.toString());
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
