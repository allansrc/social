// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:social_boticario/app/core/shared/enviroment/enviroment_variables.dart';
import 'package:social_boticario/app/modules/home/domain/erros/news_failure.dart';
import 'package:social_boticario/app/modules/home/presenter/home_controller.dart';
import 'package:social_boticario/app/modules/home/presenter/states/home_state.dart';

const urlBase = 'https://gb-mobile-app-teste.s3.amazonaws.com/data.json';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  final statusController = TextEditingController();
  @override
  void initState() {
    EnviromentVariables().urlDomain = urlBase;
    controller.getNewsList();
    controller.getPostList();
    super.initState();
  }

  @override
  void dispose() {
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScopedBuilder<HomeController, NewsListDatasourceError, HomeState>(
          store: controller,
          onLoading: (context) => const Center(child: CircularProgressIndicator()),
          onState: (context, state) {
            return Column(
              children: [
                Card(
                  child: Container(
                    width: 424,
                    height: 128,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.person),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                            child: TextField(
                              controller: statusController,
                              maxLines: 2,
                              maxLength: 280,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Começar publicação',
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: IconButton(
                            onPressed: () {
                              controller.setPostToList(statusController.text);
                              statusController.clear();
                            },
                            icon: Icon(Icons.send),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverGrid(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width * .64,
                              height: 195,
                              child: Stack(
                                children: [
                                  ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Text(
                                        state.newsList[index].user.name,
                                        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        state.newsList[index].message.content,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 64,
                                        height: 32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(4)),
                                        child: const Text(
                                          'Ver mais',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: state.newsList.length,
                          // childCount: state.newsList.length ~/ 2,
                        ),
                      ),
                      SliverFixedExtentList(
                        itemExtent: 156.0,
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.postList.length,
                          (context, index) {
                            return ListTile(
                              title: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width * .64,
                                  child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Text(
                                        state.postList[index].user,
                                        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        state.postList[index].post,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
