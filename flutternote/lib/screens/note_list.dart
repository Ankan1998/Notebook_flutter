import 'package:flutter/material.dart';
import 'package:flutternote/models/note.dart';
import 'package:flutternote/screens/note_detail.dart';
import 'package:flutternote/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  //const NoteList({ Key? key }) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  void push_nav(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = <Note>[];
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notes',
          ),
        ),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            push_nav(Note('', '', 2), "Add Note");
            //debugPrint('FAB');
          },
          tooltip: 'Add Note',
          child: Icon(Icons.add_box)),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      getPriorityColor(this.noteList[position].priority),
                  child: getPriorityIcon(this.noteList[position].priority),
                ),
                title: Text(
                  this.noteList[position].title,
                  style: titleStyle,
                ),
                subtitle: Text(this.noteList[position].date),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    _delete(context, noteList[position]);
                  },
                ),
                onTap: () {
                  push_nav(this.noteList[position], "Edit Note");
                  //debugPrint("ds");
                },
              ));
        });
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.green;
        break;
      case 3:
        return Colors.yellow;
        break;

      default:
        return Colors.green;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.arrow_upward);
        break;
      case 2:
        return Icon(Icons.arrow_right);
        break;
      case 3:
        return Icon(Icons.arrow_downward);
        break;

      default:
        return Icon(Icons.arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
