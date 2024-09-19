import 'package:flutter/material.dart';
import 'package:test1/Model/task.dart';
import 'package:test1/firebaseutilis.dart';

class Listprovider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectDate = DateTime.now();

  void getAlltasksfromfirestore() async {
    var querySnapshot = await FirebaseUtils.gettaskscollection().get();
    taskList = querySnapshot.docs.map((doc) => doc.data()).toList();

    taskList = taskList.where((task) {
      return task.datetime.year == selectDate.year &&
          task.datetime.month == selectDate.month &&
          task.datetime.day == selectDate.day;
    }).toList();

    taskList.sort((a, b) => a.datetime.compareTo(b.datetime));

    notifyListeners();
  }

  void changeselectDate(DateTime newDate) {
    selectDate = newDate;
    getAlltasksfromfirestore();
  }

  void removeTask(Task task) {
    taskList.removeWhere((t) => t.id == task.id);
    notifyListeners();

    FirebaseUtils.deleteTaskfromfireStore(task).catchError((error) {
    });
  }
}
