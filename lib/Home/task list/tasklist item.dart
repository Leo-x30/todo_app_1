import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:test1/Home/app_colors.dart';
import 'package:test1/Model/task.dart';
import 'package:test1/firebaseutilis.dart';
import 'package:test1/provider/list%20provider.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  TaskListItem({required this.task});

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  late Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
  }

  void editTaskDialog(BuildContext context) {
    final TextEditingController titleController =
    TextEditingController(text: widget.task.title);
    final TextEditingController descriptionController =
    TextEditingController(text: widget.task.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.task.title = titleController.text;
                  widget.task.description = descriptionController.text;
                });
                FirebaseUtils.updateTaskInFirestore(widget.task).then((_) {
                  Navigator.of(context).pop();
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var listprovider = Provider.of<Listprovider>(context, listen: false);
    return Slidable(
      key: ValueKey(widget.task.id),
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            // Remove the task from the provider immediately
            listprovider.removeTask(widget.task);
          },
        ),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              // Remove the task from the provider immediately
              listprovider.removeTask(widget.task);
            },
            backgroundColor: Appcolors.redcolor,
            foregroundColor: Appcolors.whitecolor,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Appcolors.whitecolor,
        ),
        child: Row(
          children: [
            Container(
              color: task.isDone ? Colors.green : Appcolors.primarycolor,
              height: MediaQuery.of(context).size.height * 0.1,
              width: 4,
            ),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onLongPress: () => editTaskDialog(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style: TextStyle(
                          fontSize: 24,
                          color: task.isDone ? Colors.green : Appcolors.primarycolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.task.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: task.isDone ? Colors.green : Appcolors.primarycolor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    task.isDone = !task.isDone;
                  });
                },
                child: Icon(
                  Icons.check,
                  size: 24,
                  color: Appcolors.whitecolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
