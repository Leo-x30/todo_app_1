import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Model/task.dart';
import 'package:test1/firebaseutilis.dart';
import 'package:test1/provider/list%20provider.dart';

class Addtaskbottomsheet extends StatefulWidget {
  @override
  State<Addtaskbottomsheet> createState() => _AddtaskbottomsheetState();
}

class _AddtaskbottomsheetState extends State<Addtaskbottomsheet> {
  final formkey = GlobalKey<FormState>();

  String title = '';
  DateTime selectDate = DateTime.now();
  String desc = '';
  late Listprovider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider =Provider.of<Listprovider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add New Task',
              style: TextStyle(fontSize: 30),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Please enter task title";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Task Title',
                      ),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Please enter task description";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Task Description',
                      ),
                      maxLines: 4,
                      onChanged: (value) {
                        desc = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Select Date'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCalender();
                      },
                      child: Text(
                          '${selectDate.day}/${selectDate.month}/${selectDate.year}'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text("Add"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTask() {
    if (formkey.currentState?.validate() == true) {
      Task task =
      Task(title: title, datetime: selectDate, description: desc);
      FirebaseUtils.addtasktofirestore(task).timeout(Duration(microseconds: 5),
          onTimeout: () {
            print('Task added');
            listProvider.getAlltasksfromfirestore();
            Navigator.pop(context);
          });
    }
  }

  void showCalender() async {
    var chosendate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    selectDate = chosendate ?? DateTime.now();
    setState(() {});
  }
}