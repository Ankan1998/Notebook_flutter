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
        title: Center(child: Text('Notie', style: MyTheme.kAppTitle)),
        toolbarHeight: 70,

      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 25,
          right: 15,
          bottom: 15
        ),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.0);
          },
          itemCount: 30,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (DismissDirection direction){
                setState(() {
                  
                });
              },
              background: SizedBox(height:0),
              secondaryBackground: Container(
                child:Center(child: Text("Delete"),),
                color: Colors.red[300].withOpacity(0.7),
              ),
              child: ClipPath(
                child: Container(
                  child: Center(
                    child: ListTile(
                      title: Text("$index"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {}, 
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xff6962BA),
                              size: 30,
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                      color: Color(0x40262502),
                      border: Border(
                          left: BorderSide(color: Colors.green, width: 20))),
                ),
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            );
          },
        ),
      ),
    );
  }
}
