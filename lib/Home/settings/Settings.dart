import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Home/app_colors.dart';
import 'package:test1/Home/settings/Theme%20Bottom%20sheet.dart';
import 'package:test1/Home/settings/language%20bottom%20sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test1/provider/provider.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();

}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          SizedBox(height: 10,),
          InkWell(
          onTap: () {
           showlanguageBottomsheet();
          },
            child: Container(
              padding: EdgeInsets.all(10)
              ,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Appcolors.whitecolor,
              border: Border.all(
                color: Appcolors.primarycolor
              )
             ),
              child: (Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applanguage == 'en'?
                   AppLocalizations.of(context)!.english:
                  AppLocalizations.of(context)!.arabic,style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_drop_down),

                ],
               )
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text(AppLocalizations.of(context)!.mode,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          SizedBox(height: 10,),
          InkWell(
          onTap: () {
            showThemeBottomsheet();
          },
            child: Container(
              padding: EdgeInsets.all(10)
              ,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Appcolors.whitecolor,
                border: Border.all(
                    color: Appcolors.primarycolor
                )
            ),
              child: (Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.light,style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_drop_down),

                ],
              )
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showlanguageBottomsheet() {
    showModalBottomSheet(
        context: context, builder: (context)=>LanguageBottomSheet()
    );
  }

  void showThemeBottomsheet() {
    showModalBottomSheet(
        context: context, builder: (context)=>ThemeBottomSheet()
    );
  }
}

