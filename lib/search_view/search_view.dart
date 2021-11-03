import 'package:flutter/material.dart';
import 'package:hive_intro/home/model/user_model.dart';
import 'package:hive_intro/manager/user_cache_manager.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.model}) : super(key: key);
  final ICacheManager<UserModel> model;
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<UserModel> _items = [];

  void findAndSet(String key) {
    _items = widget.model
            .getValues()
            ?.where((element) => element.name?.toLowerCase().contains(key.toLowerCase()) ?? false)
            .toList() ??
        [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            findAndSet(value);
          },
        ),
      ),
      body: Text(_items.map((e) => '${e.name} - ${e.company}').join(',')),
    );
  }
}
