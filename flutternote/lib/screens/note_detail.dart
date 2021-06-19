import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteDetail extends StatefulWidget {
  //const NoteDetail(String title, {Key? key}) : super(key: key);
  String barTitle;
  NoteDetail(this.barTitle);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['Urgent', 'Medium', 'Casual'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void moveToMainScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          widget.barTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    child: Text(dropDownStringItem),
                    value: dropDownStringItem,
                  );
                }).toList(),
                style: textStyle,
                value: 'Casual',
                onChanged: (value) {
                  setState(() {
                    debugPrint('user ${value}');
                  });
                },
              ),
            ),
            // Second Element
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextField(
                autofocus: false,
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  //debugPrint("Something title text field");
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            // Third element
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                autofocus: false,
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint("Something title text field");
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            // Fourth element
            Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FloatingActionButton.extended(
                        heroTag: "btn1",
                        onPressed: () {
                          //moveToMainScreen();
                          setState(() {
                            debugPrint('Save clicked');
                          });
                        },
                        tooltip: 'Save Note',
                        icon: Icon(
                          Icons.save,
                        ),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
                        label: Text('Save'),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: FloatingActionButton.extended(
                        heroTag: "btn2",
                        onPressed: () {
                          //moveToMainScreen();
                          setState(() {
                            debugPrint('delete clicked');
                          });
                        },
                        tooltip: 'Delete',
                        icon: Icon(
                          Icons.delete_forever,
                        ),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
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
