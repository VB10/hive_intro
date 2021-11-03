import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_intro/home/home_view.dart';

Future<void> main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
