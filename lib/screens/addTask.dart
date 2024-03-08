import 'package:flutter/material.dart';
import 'package:todo/util/router.dart';
import 'package:todo/util/widget.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DateTime selectedStartDate = DateTime.now();
  late DateTime selectedEndDate = DateTime.now();
  late String _taskName;
  late String _description;
  late TimeOfDay _startTime = TimeOfDay.now();
  late TimeOfDay _endTime = TimeOfDay.now();
  late TextEditingController _taskNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;

  @override
  void initState() {
    super.initState();
    _taskNameController = TextEditingController();
    _descriptionController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 20,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TaskListScreen);
                    },
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(border: Border.all(width: 0)),
                      child: Icon(Icons.arrow_back_ios),
                    )),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Add New Task',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 200,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          //labelText: 'Task Name',
                          hintText: 'task name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter task name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _taskName = value!;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Start Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 50, // Set the width here
                              child: ElevatedButton(
                                onPressed: () => _selectStartTime(context),
                                child: Text('${_startTime.format(context)}'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        Column(
                          children: [
                            Text(
                              'End Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 150,
                              height: 50, // Set the width here
                              child: ElevatedButton(
                                onPressed: () => _selectEndTime(context),
                                child: Text('${_endTime.format(context)}'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _description = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust border radius as needed
                        color: Colors.blue, // Set background color
                        border:
                            Border.all(color: Colors.black), // Set border color
                      ),
                      child: TextButton(
                        onPressed: _submitForm,
                        child: Text(
                          'Create Task',
                          style:
                              TextStyle(color: Colors.white), // Set text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Form(
            //   key: _formKey,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: <Widget>[

            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 30),
            //         child: TextFormField(
            //           // controller: _emailController,
            //           cursorColor: Colors.black,
            //           style: TextStyle(color: Color.fromARGB(255, 28, 26, 26)),
            //           decoration: buildInputDecoration('Task Name'),
            //           // validator: validateEmail,
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 30),
            //         child: TextFormField(
            //           // controller: _passwordController,

            //           cursorColor: Colors.grey, // Change cursor color
            //           style: TextStyle(color: Color.fromARGB(255, 92, 91, 91)),
            //           decoration: buildInputDecoration('Description'),
            //           // validator: validatePassword,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 30),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Expanded(
            //               child: TextFormField(
            //                 keyboardType: TextInputType.number,
            //                 // controller: _ageController,
            //                 cursorColor: Colors.grey,
            //                 style: TextStyle(
            //                     color: Color.fromRGBO(237, 234, 234, 1)),
            //                 decoration: buildInputDecoration('Start Date'),

            //                 // Additional validation for age (e.g., must be a number)

            //                 //validator: validateEmail,
            //               ),
            //             ),
            //             SizedBox(width: 5), // Spacer between Age and Grade
            //             Expanded(
            //               child: TextFormField(
            //                 //controller: _gradeController,
            //                 cursorColor: Colors.grey,
            //                 style: TextStyle(
            //                     color: Color.fromRGBO(237, 234, 234, 1)),
            //                 decoration: buildInputDecoration('End Date'),

            //                 //validator: validateEmail,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 100),
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Color(0xFF3559E0)),
            //             foregroundColor:
            //                 MaterialStateProperty.all<Color>(Colors.white),
            //           ),
            //           child
            //               // : _isLoading
            //               //     ? CircularProgressIndicator(
            //               //         valueColor: AlwaysStoppedAnimation<Color>(
            //               //             Colors.white),
            //               //       )
            //               : Text('Create Task'),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform form submission or any other actions here
      print('Task Name: $_taskName');
      print('Description: $_description');
      print('Start Time: $_startTime');
      print('End Time: $_endTime');
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (pickedTime != null && pickedTime != _startTime) {
      setState(() {
        _startTime = pickedTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (pickedTime != null && pickedTime != _endTime) {
      setState(() {
        _endTime = pickedTime;
      });
    }
  }
}
