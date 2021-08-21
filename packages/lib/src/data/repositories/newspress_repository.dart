// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:network_manager/network_manager.dart';


import 'package:newspackage/src/data/datasources/remote_data_source.dart';
import 'package:newspackage/src/data/models/article_response.dart';
import 'package:newspackage/src/domain/domain.dart';

/// Newspress repository implementation
/// 
class NewspressRepository implements INewspressRepository {
  /// Newspress repository constructor
  NewspressRepository({
    required INetworkManager networkManager,
    required IRemoteDataSource remoteDataSource,
  })   : _networkManager = networkManager,
        _remoteDataSource = remoteDataSource;

  final INetworkManager _networkManager;
  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, ArticleResponse>?> getSearch(String? q) async {
    if (await _networkManager.isConnected) {
      try {
        final result = await _remoteDataSource.getSearch(q);
        return Right(result!);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        Left(ServerException());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ArticleResponse>?> getHeadLine(
      String? country, String? category) async {
    if (await _networkManager.isConnected) {
      try {
        final result = await _remoteDataSource.getHeadLine(country, category);
        return Right(result!);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        Left(ServerException());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
