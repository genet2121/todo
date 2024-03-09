import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/taskList.dart';
import 'package:todo/screens/todoList.dart';
import 'package:todo/util/router.dart';

class Routerr {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case TodoListScreen:
        return MaterialPageRoute(builder: (BuildContext context) => TodoList());
      case HomeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        );
      case TaskListScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => TaskList(),
        );

      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }
}
