abstract class INewsFailure implements Exception {
  final String? message;
  INewsFailure({this.message});
}

class NewsListDatasourceError extends INewsFailure {
  @override
  String? message;
  NewsListDatasourceError({this.message});

  @override
  String toString() => '(message: $message)';
}

class DatasourceError extends INewsFailure {
  @override
  String? message;
  DatasourceError({this.message});

  @override
  String toString() => '(message: $message)';
}

class MapperError extends INewsFailure {
  @override
  String? message;
  MapperError({this.message});

  @override
  String toString() => '(message: $message)';
}
