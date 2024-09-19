import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Home/task%20list/tasklist%20item.dart';
import 'package:test1/provider/list%20provider.dart';

class Tasklisttab extends StatefulWidget {
  @override
  State<Tasklisttab> createState() => _TasklisttabState();
}

class _TasklisttabState extends State<Tasklisttab> {


  @override
  Widget build(BuildContext context) {
    var listprovider =Provider.of<Listprovider>(context);
    listprovider.taskList.isEmpty ? listprovider.getAlltasksfromfirestore() : null;
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            listprovider.changeselectDate(selectedDate);
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNumMonth,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: listprovider.taskList.isEmpty
              ? Text('No tasks added')
              : ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Adds vertical spacing
                child: TaskListItem(task: listprovider.taskList[index]),
              );
            },
            itemCount: listprovider.taskList.length,
          ),
        ),
      ],
    );
  }

}
