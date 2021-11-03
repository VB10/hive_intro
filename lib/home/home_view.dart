import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_intro/home/home_view_service.dart';
import 'package:hive_intro/home/model/user_model.dart';
import 'package:hive_intro/manager/user_cache_manager.dart';
import 'package:hive_intro/search_view/search_view.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final _dummyString = 'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI';

  List<UserModel>? _items;
  late final ICacheManager<UserModel> cacheManager;
  late final IHomeService _homeService;

  @override
  void initState() {
    super.initState();
    _homeService = HomeService(Dio(BaseOptions(baseUrl: _baseUrl)));
    cacheManager = UserCacheManager('userCacheNew2');
    fetchDatas();
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    if (cacheManager.getValues()?.isNotEmpty ?? false) {
      _items = cacheManager.getValues();
    } else {
      _items = await _homeService.fetchUsers();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.navigateToPage(SearchView(model: cacheManager));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          cacheManager.getValues();
          if (_items?.isNotEmpty ?? false) {
            await cacheManager.addItems(_items!);
          }
        },
      ),
      body: (_items?.isNotEmpty ?? false)
          ? ListView.builder(
              itemCount: _items?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(_dummyString)),
                    title: Text('${_items?[index].name}'),
                  ),
                );
              },
            )
          : const CircularProgressIndicator(),
    );
  }
}
