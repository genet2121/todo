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
      body: Column(
        children: [
          Center(
            child: Container(
              width: 50, // Set the width of the rectangular shape
              height: 50, // Set the height of the rectangular shape
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 205, 201, 201), // Set the background color
                borderRadius:
                    BorderRadius.circular(15), // Set the border radius
              ),
              alignment: Alignment.center,
              child: const Text(
                'T',
                style: TextStyle(
                  //color: Colors.white, // Set the text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
