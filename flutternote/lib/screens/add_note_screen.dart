import 'package:flutter/material.dart';

import 'package:flutternote/screens/add_note_screen.dart';
import 'package:flutternote/themes.dart';
import 'package:flutternote/utils/database_helper.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddNote extends StatefulWidget {
  //const NoteDetail(String title, {Key? key}) : super(key: key);
  final String barTitle;

  const AddNote({Key key, this.barTitle}) : super(key: key);
  // final Note note;
  

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  static var _priorities = ['Urgent', 'Medium', 'Casual'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String barTitle;
  // Note note;

  
  // DatabaseHelper helper = DatabaseHelper();

  void moveToMainScreen() {
    Navigator.pop(context, true);
  }

  // void updateIntPriority(String value) {
  //   switch (value) {
  //     case 'Urgent':
  //       note.priority = 1;
  //       break;
  //     case 'Medium':
  //       note.priority = 2;
  //       break;
  //     case 'Casual':
  //       note.priority = 3;
  //       break;
  //   }
  // }

  String updateStringPriority(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
      case 3:
        priority = _priorities[2];
        break;
    }
    return priority;
  }

  // void updateTitle() {
  //   note.title = titleController.text;
  // }

  // void updateDescription() {
  //   note.description = descriptionController.text;
  // }

  // void _save() async {
  //   moveToMainScreen();
  //   note.date = DateFormat.yMMMd().format(DateTime.now());

  //   int result;
  //   if (note.id != null) {
  //     result = await helper.updateNote(note);
  //   } else {
  //     result = await helper.insertNote(note);
  //   }

  //   if (result != 0) {
  //     _showAlert('Status', 'Note Saved Successfully');
  //   } else {
  //     _showAlert('Status', 'Issue raised while saving Note');
  //   }
  // }

  void _showAlert(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  // void _delete() async {
  //   moveToMainScreen();
  //   if (note.id == null) {
  //     _showAlert('Status', 'No Note deleted');
  //     return;
  //   }
  //   int result = await helper.deleteNote(note.id);
  //   if (result != 0) {
  //     _showAlert('Status', 'Note Deleted Successfully');
  //   } else {
  //     _showAlert('Status', 'Issue raised while Deleting Note');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    // titleController.text = note.title;
    // descriptionController.text = note.description;
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.barTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: [
            // ListTile(
            //   title: DropdownButton(
            //     items: _priorities.map((String dropDownStringItem) {
            //       return DropdownMenuItem<String>(
            //         child: Text(dropDownStringItem),
            //         value: updateStringPriority(1),
            //       );
            //     }).toList(),
            //     style: textStyle,
            //     value: 'Casual',
            //     onChanged: (value) {
            //       // setState(() {
            //       //   debugPrint('user ${value}');
            //       //   updateIntPriority(value);
            //       // });
            //     },
            //   ),
            // ),
            // Second Element
            SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                
                autofocus: false,
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  //debugPrint("Something title text field");
                  // updateTitle();
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0))),
              ),
            ),
            SizedBox(height:10),
            // Third element
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: null,
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  //debugPrint("Something title text field");
                  // updateDescription();
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Description',
                  labelStyle: textStyle,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0))),
              ),
            ),
            // Fourth element
            Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  left:25,
                  right:25
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FloatingActionButton.extended(
                        heroTag: "btn1",
                        onPressed: () {
                          //moveToMainScreen();
                          // setState(() {
                          //   debugPrint('Save clicked');
                          //   _save();
                          // });
                        },
                        tooltip: 'Save Note',
                        icon: Icon(
                          Icons.save,
                        ),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        label: Text('Save'),
                      ),
                    ),
                    Container(
                      width: 75.0,
                    ),
                    Expanded(
                      child: FloatingActionButton.extended(
                        heroTag: "btn2",
                        onPressed: () {
                          //moveToMainScreen();
                          // setState(() {
                          //   debugPrint('delete clicked');
                          //   _delete();
                          // });
                        },
                        tooltip: 'Delete',
                        icon: Icon(
                          Icons.delete_forever,
                        ),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        label: Text('Delete'),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
