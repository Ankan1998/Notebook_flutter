import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  MyTheme._();
  static Color kPrimaryColor = Color(0xffC1D2E5);
  static Color backgroundColor = Color(0xffD5E9ED);


  static final TextStyle kAppTitle = TextStyle(
    color: Color(0xff566FA1),
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.oxygenMono().fontFamily
  );
  
  
  static final TextStyle heading = TextStyle(
    color: Color(0xffD2C5ED),
    fontFamily: GoogleFonts.righteous(fontSize: 28).fontFamily
  );


  static final TextStyle paragraph = TextStyle(
    color: Color(0xffDBEDC5),
    fontFamily: GoogleFonts.rosarivo(fontSize: 22).fontFamily
  );


}