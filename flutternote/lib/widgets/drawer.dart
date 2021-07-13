import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/screens/login.dart';
import 'package:flutternote/services.dart/google_auth.dart';

class NoteDrawer extends StatefulWidget {
  //const NoteDrawer({ Key? key }) : super(key: key);

  @override
  _NoteDrawerState createState() => _NoteDrawerState();
}

class _NoteDrawerState extends State<NoteDrawer> {
  User user = FirebaseAuth.instance.currentUser;

  final AuthService _auth = AuthService();
  Color color1;
  Color color2;
  Color color3;
  Color color4;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              user.displayName,
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            accountEmail: Text(
              user.email,
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL),
            ),
          ),
          Container(
            color: color2,
            child: GestureDetector(
              onTap: () {
                //Navigator.pushReplacementNamed(context, Logged.routeName);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => Logged()),
                // );
                setState(() {
                  color2 = Colors.grey[800];
                });
              },
              child: ListTile(
                title: Text("Logged",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        color: Colors.white)),
              ),
            ),
          ),
          Container(
            color: color3,
            child: GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingPage()),
                // );
                setState(() {
                  color3 = Colors.grey[800];
                });
              },
              child: ListTile(
                title: Text("Settings",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        color: Colors.white)),
              ),
            ),
          ),
          Container(),
          Container(
            color: color4,
            child: GestureDetector(
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                //print(_auth.users.doc());
                setState(() {
                  color4 = Colors.lightBlue;
                });
              },
              child: ListTile(
                title: Text("Signout",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
