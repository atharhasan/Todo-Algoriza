import 'package:flutter/material.dart';
import 'package:todo_app/app_route.dart';

void main() {
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoute}) : super(key: key);
  final AppRoute appRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
