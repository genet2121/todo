import 'package:flutter/material.dart';
import 'package:todo/screens/addTask.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/taskList.dart';
import 'package:todo/screens/taskListDetail.dart';
import 'package:todo/screens/todoList.dart';
import 'package:todo/util/router.dart';

class Routerr {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case TodoListScreen:
        return MaterialPageRoute(builder: (BuildContext context) => TodoList());
      case HomeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        );
      case TaskListScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TaskList(),
        );
      case AddTaskScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AddTask(),
        );
      case TaskListDetailScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TaskListDetail(),
        );
      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }
}
