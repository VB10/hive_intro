import 'package:hive_intro/home/model/demo_model.dart';
import 'package:hive_intro/manager/user_cache_manager.dart';

class DemoCacheManager extends ICacheManager<DemoModel> {
  DemoCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<DemoModel> items) {
    // TODO: implement addItems
    throw UnimplementedError();
  }

  @override
  DemoModel? getItem(String key) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> putItem(String key, DemoModel item) {
    // TODO: implement putItem
    throw UnimplementedError();
  }

  @override
  Future<void> putItems(List<DemoModel> items) {
    // TODO: implement putItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(String key) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  List<DemoModel>? getValues() {
    // TODO: implement getValues
    throw UnimplementedError();
  }

  @override
  void registerAdapters() {
    // TODO: implement registerAdapters
  }
}
