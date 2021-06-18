import 'package:flutter/material.dart';
import 'package:flutternote/screens/note_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteSet',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: NoteList(),
    );
  }
}


