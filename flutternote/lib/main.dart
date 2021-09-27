import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutternote/models/note.dart';
import 'package:flutternote/screens/note_detail.dart';
//import 'package:flutternote/screens/note_detail.dart';
import 'package:flutternote/screens/splash_screen.dart';
import 'package:flutternote/themes.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() {
  runApp(MyApp());
  // // open the hive box
  // final notebox = await Hive.openBox('notes');
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    hiveinit();
  }

  Future hiveinit() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(NoteAdapter());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notie',
      theme: ThemeData(
        primaryColor: MyTheme.kPrimaryColor,
      ),
      home: SplashScreenx(),
    );
  }
}
