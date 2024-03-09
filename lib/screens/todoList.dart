import 'package:flutter/material.dart';
import 'package:todo/model/categories.dart';
import 'package:todo/util/router.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Todo List',
          style: TextStyle(color: Color.fromARGB(255, 3, 53, 133)),
        )),
      ),
      body: Center(
        // Adjust the width as needed
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              leading: Image.asset(
                category.image,
                width: screenWidth * 0.25,
                height: screenHeight * 0.25,
              ),
              title: Column(
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 3, 53, 133), fontSize: 22),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text('hey'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, TaskListScreen);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF0B59D7)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('View'),
                  ),
                ],
              ),
              onTap: () {
                // Handle onTap event
              },
            );
          },
        ),
      ),
    );
  }
}
