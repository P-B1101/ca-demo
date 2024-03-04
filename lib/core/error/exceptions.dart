import 'package:equatable/equatable.dart';

/// Throw this exception in DataSource if API return failure response.
///
class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException({this.message});

  @override
  List<Object?> get props => [message];
}

class UnAuthorizeException extends Equatable implements Exception {
  const UnAuthorizeException();
  @override
  List<Object?> get props => [];
}

class AccessDeniedException extends Equatable implements Exception {
  const AccessDeniedException();
  @override
  List<Object?> get props => [];
}
