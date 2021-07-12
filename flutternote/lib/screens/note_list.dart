import 'package:flutter/material.dart';
import 'package:flutternote/models/note.dart';
import 'package:flutternote/screens/note_detail.dart';
import 'package:flutternote/services.dart/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class NoteList extends StatefulWidget {
  //const NoteList({ Key? key }) : super(key: key);
  static final String routeName = "/home";

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  FireStore_srv srv_obj = new FireStore_srv();

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection('reminder');

  // void push_nav(Note note, String title) async {
  //   bool result =
  //       await Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return NoteDetail(note, title);
  //   }));
  //   if (result == true) {
  //     updateListView();
  //   }
  // }

  // void updateListView() {
  //   final Future<Database> dbFuture = databaseHelper.initializeDatabase();
  //   dbFuture.then((database) {
  //     Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
  //     noteListFuture.then((noteList) {
  //       setState(() {
  //         this.noteList = noteList;
  //         this.count = noteList.length;
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var refx = ref.orderBy("datetime", descending: false);
    return FutureBuilder<QuerySnapshot>(
      future: refx.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.docs.length == 0) {
            return Center(
                child: Text("No Reminders",
                    style: TextStyle(
                      color: Colors.black45,
                    )));
          }
          return StickyGroupedListView<QueryDocumentSnapshot, DateTime>(
            physics: AlwaysScrollableScrollPhysics(),
            elements: snapshot.data.docs,
            order: StickyGroupedListOrder.DESC,
            //itemCount: snapshot.data.docs.length,
            groupBy: (QueryDocumentSnapshot s) => DateTime(DateTime.parse(s['datetime']).year,DateTime.parse(s['datetime']).month,DateTime.parse(s['datetime']).day),
            groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
            itemComparator: (QueryDocumentSnapshot s1, QueryDocumentSnapshot s2) =>
              s1['datetime'].compareTo(s2['datetime']),
            groupSeparatorBuilder: (QueryDocumentSnapshot s) => Container(
              height: 50,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  // border: Border.all(
                  //   color: Colors.blue[300],
                  // ),
                  //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(
                    //'${DateTime.parse(s['datetime']).day}. ${DateTime.parse(s['datetime']).month}, ${DateTime.parse(s['datetime']).year}',
                    '${DateFormat.yMMMd().format(DateTime(DateTime.parse(s['datetime']).year,DateTime.parse(s['datetime']).month,DateTime.parse(s['datetime']).day))}'
                  ),
                ),
              ),
            ),
            itemBuilder: (context, QueryDocumentSnapshot s) {
              Map data = s.data();
              DateTime mydateTime = DateTime.parse(data['datetime']);
              String formattedTime =
                  DateFormat.yMMMd().add_jm().format(mydateTime);

              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Card(
                  elevation: 1,
                  //clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0)),
                  child: ListTile(                   
                    title: Text(
                      "${data['title']}",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: Colors.black45),
                    ),
                    subtitle: Text("${data['des']}"),
                    trailing: Text(formattedTime)
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Done',
                    color: Colors.green,
                    icon: Icons.check,
                    onTap: () {
                      setState(() {
                        srv_obj.add_log(data);
                        srv_obj.deleteReminder(
                            s.reference);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${data['title']} is Logged')));
                        print("Done");
                      });
                    },
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete_forever,
                    onTap: () {
                      setState(() {
                        
                        srv_obj.deleteReminder(
                            s.reference);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${data['title']} is Deleted')));
                        print("Done");
                      });
                      // setState(() {

                      // });
                    },
                  ),
                ],
              );
            }
          );
        } else {
          return Center(
            child: Text("loading"),
          );
        }
      },
    );
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



}
