import 'dart:async';
import 'dart:io';

import 'package:d_demo/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/utils/m_logger.dart';
import '../../core/utils/typedef.dart';

abstract class RepositoryHelper {
  Future<Either<Failure, T>> tryToLoad<T>(LoadOrFail<T> loadOrFail);

  Future<Either<Failure, T>> tryToAuthLoad<T>(
      AuthorizedLoadOrFail<T> loadOrFail);
}

@LazySingleton(as: RepositoryHelper)
class RepositoryHelperImpl implements RepositoryHelper {
  final NetworkInfo networkInfo;
  const RepositoryHelperImpl({
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, T>> tryToLoad<T>(LoadOrFail<T> loadOrFail) async =>
      _tryToLoad((token) async => await loadOrFail());

  @override
  Future<Either<Failure, T>> tryToAuthLoad<T>(
    AuthorizedLoadOrFail<T> loadOrFail,
  ) async =>
      _tryToLoad((token) async => await loadOrFail(token!), true);

  Future<Either<Failure, T>> _tryToLoad<T>(
    Future<T> Function(String? token) tryToLoad, [
    bool isAuthorized = false,
  ]) async {
    /// comment this line of code so demo app can work offline.
    // if (!(await networkInfo.isConnected)) return Left(NetworkFailure());
    try {
      String? token;
      if (isAuthorized) {
        token = 'token';
      }
      return Right(await tryToLoad(token));
    } on ServerException catch (error) {
      MLogger.log(error.toString());
      return Left(ServerFailure(message: error.message));
    } on UnAuthorizeException {
      // Do refresh token and recall last request.
      MLogger.log('UnAuthorizeException');
      return Left(AuthenticationFailure());
    } on AccessDeniedException {
      MLogger.log('AccessDeniedException');
      return Left(AccessDeniedFailure());
    } on SocketException catch (error) {
      MLogger.log(error.toString());
      return const Left(ServerFailure());
    } on Exception catch (error) {
      MLogger.log(error.toString());
      return const Left(ServerFailure());
    }
  }
}
