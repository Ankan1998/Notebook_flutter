// import 'package:due_to_do/widgets/add_reminder.dart';
// import 'package:due_to_do/widgets/due_drawer.dart';
// import 'package:due_to_do/widgets/grouped_list_reminder.dart';
// import 'package:due_to_do/widgets/list_reminder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/screens/note_list.dart';
import 'package:flutternote/widgets/drawer.dart';

class NoteApp extends StatefulWidget {
  //const DueApp({ Key? key }) : super(key: key);
  static final String routeName = "/home";

  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('ALL NOTES'),
        centerTitle: true,
        // backgroundColor: Colors.teal[700],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, AddReminder.routeName)
                //     .then((value) {
                //   print(value);
                //   setState(() {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('${value}')));
                //   });
                // });
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),

      extendBodyBehindAppBar: false,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
        ),

        //This will change the drawer background to blue.
        child: NoteDrawer(),
      ),
      body: NoteList(),
      backgroundColor: Colors.grey[300],
    );
  }
}
