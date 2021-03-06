// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:newspackage/src/data/models/article_response.dart';

import 'package:newspackage/src/domain/repositories/inewspress_repository.dart';


// ignore: public_member_api_docs
class GetSearch {
  // ignore: public_member_api_docs
  GetSearch({required INewspressRepository repository}) : 
  _repository = repository;

  final INewspressRepository _repository;

  /// Callable class method
  // ignore: lines_longer_than_80_chars
  Future<Either<Failure, ArticleResponse>?> call(String? q) async => await _repository.getSearch(q);
  
}
