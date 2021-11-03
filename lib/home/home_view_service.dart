// https://jsonplaceholder.typicode.com/users

import 'dart:io';

import 'package:dio/dio.dart';

import 'model/user_model.dart';

abstract class IHomeService {
  late final Dio _dio;
  final _userPath = '/users';

  IHomeService(Dio dio) {
    _dio = dio;
  }
  Future<List<UserModel>?> fetchUsers();
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<List<UserModel>?> fetchUsers() async {
    final response = await _dio.get(_userPath);

    if (response.statusCode == HttpStatus.ok) {
      final responses = response.data;
      if (responses is List) {
        return responses.map((e) => UserModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
