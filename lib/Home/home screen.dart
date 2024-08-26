import 'package:flutter/material.dart';
import 'package:test1/Home/app_colors.dart';
import 'package:test1/Home/settings/Settings.dart';
import 'package:test1/Home/task%20list/addtaskbottomsheet.dart';
import 'package:test1/Home/task%20list/tasklisttab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindx =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .19,
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: selectedindx,
          onTap:(value) {
            selectedindx=value;
            setState(() {

            });
          }
          ,items: [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: AppLocalizations.of(context)!.taskList,),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings,),
      ]
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Appcolors.primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white,
            width: 4
          )
        ),
        onPressed: () {
          addTaskBottomShield();
        },
        child: Icon(Icons.add,size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: selectedindx == 0 ? Tasklisttab() : Settings(),
    );
  }

  void addTaskBottomShield() {
    showModalBottomSheet(context: context,
      builder: (context) => Addtaskbottomsheet(),
    );
  }
}