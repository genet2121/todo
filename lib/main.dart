import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/util/router.dart';
import 'package:todo/util/router_path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String initialRoute = TodoListScreen;

  runApp(
    MyApp(
      initialRoute: initialRoute,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routerr.generateRouter,
      initialRoute: initialRoute,
    );
  }
}
