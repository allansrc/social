import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecase/save_request.dart';
import 'domain/usecase/sync_request.dart';

import 'presenter/queue_request_controller.dart';

class QueueRequestModule extends Module {
  static List<Bind> exports = [
    //libs

    //external

    //infra

    //domain
    Bind((i) => SyncRequest(i(), i(), i())),
    Bind((i) => SaveRequest(i())),

    //presenter
    Bind((i) => QueueRequestController(i(), i())),
  ];

  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [];
}
