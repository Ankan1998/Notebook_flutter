import 'package:flutter/material.dart';
import 'package:flutternote/screens/add_note_screen.dart';
import 'package:flutternote/screens/note_detail.dart';
import 'package:flutternote/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteList extends StatefulWidget {
  //const NoteList({ Key? key }) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  Box noteBox;
  @override
  void initState() {
    super.initState();
  }

  Future hivebox() async {
    noteBox = await Hive.openBox('notes');
    // print(widget.noteBox);
    return noteBox;
  }

  void _showAlert(String title) {

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(context);
      },
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text("Delete"),
      content:Text(title),
      actions: [
        okButton
      ],
    );
    // showDialog(context: context, builder: (_) => alertDialog);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
      onPressed: () async {
        await noteBox.clear();
        Navigator.of(context).pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("All Notes will be Deleted"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
    // print(widget.noteBox);

    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text('Notie', style: MyTheme.kAppTitle)),
        toolbarHeight: 60,
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 25,
            right: 15,
          ),
          child: FutureBuilder(
              future: hivebox(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ValueListenableBuilder(
                      valueListenable: noteBox.listenable(),
                      builder: (context, notesbox, _) {
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10.0);
                          },
                          itemCount: notesbox.length,
                          itemBuilder: (context, index) {
                            final notexi = notesbox.getAt(index);
                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  _showAlert("${notexi.title} is deleted");
                                  notesbox.deleteAt(index);
                                });
                              },
                              background: SizedBox(height: 0),
                              secondaryBackground: Container(
                                child: Center(
                                  child: Text("Delete"),
                                ),
                                color: Colors.red[300].withOpacity(0.7),
                              ),
                              child: notelist(notexi,index),
                            );
                          },
                        );
                      });
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 30),
                      Text("Loading Please Wait...",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 24))
                    ],
                  ),
                );
              })),
      bottomNavigationBar: bottombar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: addnotebutton(),
    );
  }

  Widget notelist(var notexi,int index) {
    return ClipPath(
      child: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NoteDetail(notedetail: notexi)),
              );
            },
            child: ListTile(
              title: Text(notexi.title),
              subtitle: Text(notexi.date),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                              AddNote(
                                barTitle: "Edit Note",
                                notex: notexi,
                                nindex:index
                              )
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xff211B5F),
                        size: 30,
                      )),
                ],
              ),
            ),
          ),
        ),
        height: 80,
        decoration: BoxDecoration(
            color: Color(0x40262502),
            border: Border(
                left: BorderSide(
                    color: getPriorityColor(notexi.priority), width: 20))),
      ),
      clipper: ShapeBorderClipper(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }

  Widget addnotebutton() {
    return Container(
      height: 65.0,
      width: 65.0,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Color(0xff6962BA),
          elevation: 3,
          child: Icon(
            Icons.add,
            size: 42,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNote(
                        barTitle: 'Add Note',
                      )),
            );
          },
          tooltip: 'Add Note',
        ),
      ),
    );
  }

  BottomAppBar bottombar() {
    return BottomAppBar(
        color: Color(0xffB8B9D1),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  icon: Icon(
                    Icons.delete_sweep,
                    color: Color(0xffBA6262),
                    size: 40,
                  )),
            ],
          ),
        ));
  }
}
