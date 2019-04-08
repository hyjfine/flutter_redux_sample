import 'package:flutter/material.dart';
import 'package:flutter_app_redux/app_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppRoute.global.buildPage('todo_list', null),
//      ),
    );
  }
}
