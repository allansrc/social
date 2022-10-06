import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_boticario/app/core/modules/storage/storage_module.dart';

import 'core/modules/connectivity_check/connectivity_check_module.dart';
import 'core/modules/queue_request/queue_request_module.dart';
import 'modules/auth/login_module.dart';
import 'modules/auth/splash_page.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...StorageModule.exports,
    ...ConnectivityCheckModule.exports,
    ...QueueRequestModule.exports,
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
