import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  MyTheme._();
  static Color kPrimaryColor = Color(0xffB8B9D1);
  static Color backgroundColor = Color(0xffD5E9ED);


  static final TextStyle kAppTitle = TextStyle(
    color: Colors.white,//Color(0xff566FA1),
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.oxygenMono().fontFamily
  );
  
  
  static final TextStyle heading = TextStyle(
    color: Color(0xffD2C5ED),
    fontFamily: GoogleFonts.righteous(fontSize: 28).fontFamily
  );


  static final TextStyle paragraph = TextStyle(
    color: Color(0xff0E2850),
    fontSize: 20,
    fontFamily: GoogleFonts.rosarivo().fontFamily
  );

  static final TextStyle subtitle = TextStyle(
    color: Colors.grey[700],
    fontSize: 16,
    fontFamily: GoogleFonts.roboto().fontFamily
  );


}