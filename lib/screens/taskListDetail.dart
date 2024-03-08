import 'package:flutter/material.dart';
import 'package:todo/util/router.dart';

class TaskListDetail extends StatefulWidget {
  const TaskListDetail({super.key});

  @override
  State<TaskListDetail> createState() => _TaskListDetailState();
}

class _TaskListDetailState extends State<TaskListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushNamed(context, TaskListScreen);
          },
        ),
      ),
    );
  }
}
