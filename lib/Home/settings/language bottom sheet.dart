import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:test1/provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    String currentLanguage = provider.applanguage;
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    provider.changelanguage('en');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.english,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                if (currentLanguage == 'en') Icon(Icons.check),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    provider.changelanguage('ar');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.arabic,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                if (currentLanguage == 'ar') Icon(Icons.check),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
