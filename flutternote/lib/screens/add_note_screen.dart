import 'package:flutter/material.dart';
import 'package:flutternote/models/note.dart';

import 'package:flutternote/screens/add_note_screen.dart';
import 'package:flutternote/themes.dart';
import 'package:flutternote/utils/database_helper.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddNote extends StatefulWidget {
  //const NoteDetail(String title, {Key? key}) : super(key: key);
  final String barTitle;
  // Note note;
  const AddNote({Key key, this.barTitle}) : super(key: key);
  // final Note note;

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Note note_;
  static var _priorities = ['Urgent', 'Medium', 'Casual'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String barTitle;



  void moveToMainScreen() {
    Navigator.pop(context, true);
  }

  // void updateTitle() {
  //   note.title = titleController.text;
  // }

  // void updateDescription() {
  //   note.description = descriptionController.text;
  // }

  void _save(Note notex) {
    final notebox = Hive.box('notes');
    notex.date = DateFormat.yMMMd().format(DateTime.now());
    notebox.add(notex);
    // widget.note.date = DateFormat.yMMMd().format(DateTime.now());

    moveToMainScreen();
  }



  void _delete() async {
    moveToMainScreen();
  }

  Widget _buildtitle() {
    return TextField(
      autofocus: false,
      controller: titleController,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Title',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
    );
  }

  Widget _builddescription() {
    return TextField(
      keyboardType: TextInputType.multiline,
      minLines: 15,
      maxLines: null,
      controller: descriptionController,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Description',
          alignLabelWithHint: true,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
    );
  }

  Widget _savebutton() {
    return Expanded(
      child: FloatingActionButton.extended(
        heroTag: "btn1",
        onPressed: () {
          note_ = Note(
              1, titleController.text, '', 2, descriptionController.text);
          print(note_.title);
          _save(note_);
          // moveToMainScreen();
        },
        tooltip: 'Save Note',
        icon: Icon(
          Icons.save,
        ),
        backgroundColor: Colors.lightGreen[600].withOpacity(0.7),
        foregroundColor: Colors.white,
        label: Text('Save'),
      ),
    );
  }

  Widget _cancelbutton() {
    return Expanded(
      child: FloatingActionButton.extended(
        heroTag: "btn2",
        onPressed: () {
          moveToMainScreen();
        },
        tooltip: 'Cancel',
        icon: Icon(
          Icons.cancel,
        ),
        backgroundColor: Colors.red[200].withOpacity(0.9),
        foregroundColor: Colors.white,
        label: Text('Cancel'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildtitle(),
            ),
            SizedBox(height: 10),
            // Third element
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _builddescription(),
            ),
            // Fourth element
            Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 25, right: 25),
                child: Row(
                  children: <Widget>[
                    _savebutton(),
                    Container(
                      width: 75.0,
                    ),
                    _cancelbutton()
                  ],
                )
                )
          ],
        ),
      ),
    );
  }
}
