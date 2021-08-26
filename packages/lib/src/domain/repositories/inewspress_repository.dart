import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:newspackage/src/data/models/article_response.dart';

/// Repository interface for newspress
abstract class INewspressRepository {
  // ignore: public_member_api_docs
  Future<Either<Failure, ArticleResponse>?> getHeadLine(
      String? country, String? category);
  // ignore: lines_longer_than_80_chars
  // ignore: public_member_api_docs
  Future<Either<Failure, ArticleResponse>?> getSearch(String? q);
}
