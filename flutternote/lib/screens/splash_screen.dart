import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/screens/note_list.dart';
import 'package:flutternote/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class SplashScreenx extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenxState createState() => _SplashScreenxState();
}

class _SplashScreenxState extends State<SplashScreenx> {
  @override  
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NoteList()),
            ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("IMAGE")
            // child: ClipOval(
            //   child: Image.asset(
            //     "images/git1.png",
            //     height: 200,
            //     width: 200,
            //   ),
            // ),
          ),
          SizedBox(height:50.0),
          Text(
            'API',
            style: MyTheme.kAppTitle
          )
        ],
      )
    );
  }
}