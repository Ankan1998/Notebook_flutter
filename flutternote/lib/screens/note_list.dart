import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  //const NoteList({ Key? key }) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  int count = 0;
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
        onPressed: () {
          debugPrint('FAB');
        },
        tooltip: 'Add Note',
        child: Icon(
          Icons.add_box
        )
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;
    
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color:Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.keyboard_arrow_right_outlined
              ),
            ),
            title: Text(
              'Dummy Title',
              style: titleStyle,
            ),
            subtitle:Text(
              'Dummy Date'
            ),
            trailing: Icon(
              Icons.delete,
              color: Colors.grey,  
            ),
            onTap: (){
              debugPrint("ds");
            },

          )
        );
      }
    );
  }
}
