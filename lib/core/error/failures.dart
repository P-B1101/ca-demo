import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

/// Return [ServerFailure] from Repository to the UseCase
///
/// if [ServerException] thrown in the DataSource.
///
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}

/// Return [AuthenticationFailure] from Repository to the UseCase
///
/// if status code is 401 happened.
///
class AuthenticationFailure extends Failure {}

/// Return [NetworkFailure] from Repository to the UseCase
///
/// if no internet access occurred
///
class NetworkFailure extends Failure {}

/// Return [AccessDeniedFailure] from Repository to the UseCase
///
/// if status code is 403 happened.
///
class AccessDeniedFailure extends Failure {}
