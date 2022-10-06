import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/check_connection.dart';
import 'domain/usecases/check_connection_type.dart';
import 'domain/usecases/listen_connection_stream.dart';
import 'external/drivers/flutter_connectivity_driver.dart';
import 'infra/services/connectivity_service.dart';
import 'presenter/check_connection_controller.dart';

class ConnectivityCheckModule extends Module {
  static List<Bind> exports = [
    //libs
      Bind((i) => Connectivity()),

    //external
    Bind((i) => FlutterConnectivityDriver(i())),

    //infra
    Bind((i) => ConnectivityService(i())),

    //domain
    Bind((i) => CheckConnection(i())),
    Bind((i) => ListenConnectionStream(i())),
    Bind((i) => CheckConnectionType(i())),

    //presenter
    Bind((i) => CheckConnectionController(i(), i(), i())),

  ];
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [];
}
