import 'package:flutter/material.dart';
import 'package:todo/util/router.dart';
import 'package:todo/util/router_path.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(leading: const Icon(Icons.arrow_back)),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 10,
            child: GestureDetector(
              onTap: () {
                // Navigate back when arrow icon is pressed
                Navigator.pushNamed(context, TodoListScreen);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 20,
            // right: 0,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General Task',
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 53, 133),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Text('10 tasks here'),
              ],
            ),
          ),
          Positioned(
            top: 90,
            right: 40,
            child: SizedBox(
              width: 36, // Adjust the width as needed
              height: 36, // Adjust the height as needed
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(245, 127, 23, 1),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero, // Remove any padding
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AddTaskScreen);
                },
                child: const Icon(Icons.add,
                    size: 20), // Adjust the size of the icon as needed
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: SizedBox(
              width: screenWidth * 0.88, // Set the width of the container
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 36, // Set the width of the rectangular shape
                          height: 36, // Set the height of the rectangular shape
                          color: Color.fromARGB(
                              255, 15, 29, 226), // Set the background color
                          alignment: Alignment.center,
                          child: const Text(
                            'T',
                            style: TextStyle(
                              color: Colors.white, // Set the text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                            width:
                                8), // Add some spacing between the rectangular shape and the text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Display Title here',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Start Date - End Date',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 63,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, TaskListDetailScreen);
                          },
                          child: Text('ViewDetail'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
