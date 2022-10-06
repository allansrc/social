abstract class IConnectionFailure implements Exception {
  final String message;

  IConnectionFailure(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}


class ConnectionError extends IConnectionFailure {
  ConnectionError(String message) : super(message);
}
