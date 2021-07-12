import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/screens/login.dart';
//import 'package:flutternote/screens/note_detail.dart';
import 'package:flutternote/screens/note_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      //   localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      //   DefaultMaterialLocalizations.delegate,
      //   DefaultWidgetsLocalizations.delegate,
      //   DefaultCupertinoLocalizations.delegate,
      // ],
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginPage(),
      routes: {
        NoteList.routeName: (ctx) => NoteList(),
        // AddReminder.routeName: (ctx) => AddReminder(),
        // LoginPage.routeName: (ctx) => LoginPage(),
        
        //SettingPage.routeName: (ctx) => SettingPage(),
        //LocalizedBird.routeName: (ctx) => LocalizedBird()
      },
    ),
  );
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'NoteSet',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//       ),
//       home: NoteList(),
//     );
//   }
// }


