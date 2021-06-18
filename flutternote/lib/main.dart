import 'package:flutter/material.dart';

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
        primarySwatch: Colors.red,
      ),
      home: NoteList(),
    );
  }
}


class NoteList extends StatefulWidget {
  const NoteList({ Key? key }) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
