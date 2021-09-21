import 'package:flutter/material.dart';
//import 'package:flutternote/screens/note_detail.dart';
import 'package:flutternote/screens/note_list.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {

  // get the path for hive storage
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  // Init the hive
  Hive.init(appDocumentDirectory.path);
  runApp(MyApp());
  // open the hive box
  final notebox = await Hive.openBox('notes');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notie',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: NoteList(),
    );
  }
}
