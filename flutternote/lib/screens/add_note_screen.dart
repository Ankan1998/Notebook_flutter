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
  static var _priorities = ['Casual', 'Medium', 'Important'];
  String _chosenValue=_priorities[0];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  void moveToMainScreen() {
    Navigator.pop(context, true);
  }

  void _save(Note notex) {
    final notebox = Hive.box('notes');
    notebox.add(notex);

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

  Widget dropdown() {
    return Padding(
      padding: const EdgeInsets.only(
        top:5,
        left:20,
        right:200
      ),
      child: Container(               
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color(0xFFF2F2F2)
        ),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,               
            value: _chosenValue,
            items: _priorities.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                
                child: Text(dropDownStringItem),
                value: dropDownStringItem,
              );
            }).toList(),
        
            onChanged: (value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _savebutton() {
    return Expanded(
      child: FloatingActionButton.extended(
        heroTag: "btn1",
        onPressed: () {
          var color_code = {'Casual': 0, 'Medium': 1, 'Important': 2};
          note_ = Note(
              1,
              titleController.text,
              DateFormat.yMMMd().format(DateTime.now()),
              color_code[_chosenValue],
              descriptionController.text);
          
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
            dropdown(),
            // Second Element
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildtitle(),
            ),
            
            // Third element
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _builddescription(),
            ),
            // Fourth element
            Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 25, right: 25),
                child: Row(
                  children: <Widget>[
                    _savebutton(),
                    Container(
                      width: 75.0,
                    ),
                    _cancelbutton()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
