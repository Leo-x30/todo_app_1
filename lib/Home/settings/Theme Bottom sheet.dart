import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test1/provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    ThemeMode currentTheme = provider.apptheme;

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.light);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.light,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  if (currentTheme == ThemeMode.light) Icon(Icons.check),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dark,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  if (currentTheme == ThemeMode.dark) Icon(Icons.check),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
