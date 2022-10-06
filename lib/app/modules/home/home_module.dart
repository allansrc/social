import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_boticario/app/modules/home/domain/usecases/get_news_list_usecase.dart';
import 'package:social_boticario/app/modules/home/domain/usecases/get_post_list_usecase.dart';
import 'package:social_boticario/app/modules/home/external/datasources/get_news_list_datasource_impl.dart';
import 'package:social_boticario/app/modules/home/external/datasources/get_post_list_datasource_impl.dart';
import 'package:social_boticario/app/modules/home/infra/repositories/get_news_list_respository_impl.dart';
import 'package:social_boticario/app/modules/home/infra/repositories/get_post_list_respository_impl.dart';
import 'package:social_boticario/app/modules/home/presenter/home_controller.dart';
import 'package:social_boticario/app/modules/home/presenter/stores/get_news_list_store.dart';

import 'presenter/home_page.dart';
import 'presenter/stores/get_posts_list_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // domain
    Bind((i) => GetNewsList(i())),
    Bind((i) => GetPostList(i())),
    // infra
    Bind((i) => GetNewsListRepository(i())),
    Bind((i) => GetPostListRepository(i())),
    // external
    Bind((i) => GetNewsListDatasource(i())),
    Bind((i) => GetPostListDatasource(i())),
    // presenter
    Bind((i) => HomeController(i(), i())),
    Bind((i) => GetNewsListStore(i(), i())),
    Bind((i) => GetPostListStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
