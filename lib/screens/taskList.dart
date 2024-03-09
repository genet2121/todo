import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(leading: const Icon(Icons.arrow_back)),
      body: Stack(
        children: [
          Positioned(top: 50, left: 10, child: Icon(Icons.arrow_back)),
          Positioned(
            top: 90,
            left: 20,
            // right: 0,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'hey',
                      style: TextStyle(
                          color: Color.fromARGB(255, 3, 53, 133), fontSize: 22),
                    ),
                  ],
                ),
                Text('hello')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
