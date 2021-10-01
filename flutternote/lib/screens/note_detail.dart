import 'package:flutter/material.dart';
import 'package:flutternote/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDetail extends StatefulWidget {
  
  final notedetail;

  const NoteDetail({Key key, this.notedetail}) : super(key: key);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 0:
        return Color(0x99DCDF3B);
        break;
      case 1:
        return Color(0x9952DF3B);
        break;
      case 2:
        return Color(0x99DF3B3B);
        break;

      default:
        return Color(0x9952DF3B);
    }
  }


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
          child: ClipPath(
            child: Container(
              
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.81,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Text(
                    widget.notedetail.description,
                    style:TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.roboto().fontFamily
                    )
                  )
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                      color: getPriorityColor(widget.notedetail.priority), width: 20)),
                // borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
            clipper: ShapeBorderClipper(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
          )));
  }
}
