import 'package:flutter/material.dart';
import 'package:flutternote/themes.dart';


class NoteList extends StatefulWidget {
  //const NoteList({ Key? key }) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text('Notie', style: MyTheme.kAppTitle),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 25,
          right: 15,
        ),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.0);
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return ClipPath(
              child: Container(
                child: Center(
                  child: ListTile(
                    title: Text("$index"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ),
                height: 70,
                decoration: BoxDecoration(
                    color: Color(0x40262502),
                    border: Border(
                        left: BorderSide(color: Colors.green, width: 20))),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            );
          },
        ),
      ),
    );
  }
}
