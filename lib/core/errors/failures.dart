abstract class Failure implements Exception {
  final String message;

  Failure({required this.message});
}
class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
class CacheFailure extends Failure{
  CacheFailure({required super.message});
}
class NetworkFailure extends Failure{
  NetworkFailure({required super.message});
}
class TimeoutFailure extends Failure{
  TimeoutFailure({required super.message});
}