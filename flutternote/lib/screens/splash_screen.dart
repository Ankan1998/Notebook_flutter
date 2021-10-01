import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/screens/note_list.dart';
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
        Duration(seconds: 5),
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
            // child: Text("IMAGE")
            child: Image.asset(
              "images/note1.png",
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(height:50.0),
          Text(
            'NOTIE',
            style: TextStyle(
              color: Color(0xff6962BA),
              fontSize: 34,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.oxygenMono().fontFamily
            )
          )
        ],
      )
    );
  }
}