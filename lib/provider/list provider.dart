import 'package:flutter/material.dart';
import 'package:test1/Model/task.dart';
import 'package:test1/firebaseutilis.dart';

class Listprovider extends ChangeNotifier{
  List<Task> taskList = [];
  var selectDate = DateTime.now();

  void getAlltasksfromfirestore() async {
    var querySnapshot = await FirebaseUtils.gettaskscollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task) {
      return selectDate.day == task.datetime.day &&
          selectDate.month == task.datetime.month &&
          selectDate.year == task.datetime.year;
    }).toList();


    taskList.sort((a, b) => a.datetime.compareTo(b.datetime));

    notifyListeners();
  }

  void changselectDate(DateTime newDate) {
    selectDate = newDate;
    getAlltasksfromfirestore();
  }
}
