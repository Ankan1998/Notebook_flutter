import 'package:flutter/material.dart';
import 'package:flutternote/screens/note_detail.dart';

class NoteList extends StatefulWidget {
  //const NoteList({ Key? key }) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  void push_nav(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));
  }

  @override
  Widget build(BuildContext context) {
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
            push_nav("Add Note");
            //debugPrint('FAB');
          },
          tooltip: 'Add Note',
          child: Icon(Icons.add_box)),
    );
  }

  ListView getNoteListView() {
    TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.keyboard_arrow_right_outlined),
                ),
                title: Text(
                  'Dummy Title',
                  style: titleStyle,
                ),
                subtitle: Text('Dummy Date'),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {
                  push_nav("Edit Note");
                  //debugPrint("ds");
                },
              ));
        });
  }
}
