class EnviromentVariables {
  static final EnviromentVariables _singleton = EnviromentVariables._internal();

  factory EnviromentVariables() {
    return _singleton;
  }

  EnviromentVariables._internal();

  String _urlDomain = '';
  set urlDomain(String value) => _urlDomain = value.endsWith('/') ? value.substring(0, value.length) : value;
  String get urlDomain => _urlDomain;
}
