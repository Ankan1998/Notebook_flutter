import 'package:flutter/material.dart';
import 'package:flutternote/themes.dart';

class NoteDetail extends StatefulWidget {
  
  final notedetail;

  const NoteDetail({Key key, this.notedetail}) : super(key: key);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: MyTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.notedetail.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.81,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(child: Text(widget.notedetail.description)),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          )));
  }
}
