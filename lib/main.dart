import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/Home/authentiction/login/loginscreen.dart';
import 'package:test1/Home/authentiction/register/register%20screen.dart';
import 'package:test1/Home/home%20screen.dart';
import 'package:test1/Home/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test1/provider/list%20provider.dart';
import 'package:test1/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyBeE-S5vfknuIqx82nt7E6LH61Fff7bnnI",
        appId: "com.example.test1",
        messagingSenderId: "832751717843",
        projectId: "to-doapp-pua")
  ):await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Appconfigprovider()),
        ChangeNotifierProvider(create: (context) => Listprovider()),
      ],
      child: Myapp(),
    ),
  );
}
class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<Appconfigprovider>(context);
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: LoginScreen.routename,
     routes:{
      HomeScreen.routName : (context) => HomeScreen(),
       RegisterScreen.routename:(context) => RegisterScreen(),
       LoginScreen.routename:(context)=>LoginScreen()
      },
      theme: Mytheme.lighttheme,
      darkTheme: Mytheme.darktheme,
      themeMode: provider.apptheme,
      locale: Locale(provider.applanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
