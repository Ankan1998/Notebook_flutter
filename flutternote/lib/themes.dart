import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  MyTheme._();
  static Color kPrimaryColor = Color(0xff542BAB);
  static Color kPrimaryColorHeader = Color(0xff2B9BAB);
  static Color kplot = Color(0xffDBEDC5);
  static Color kcast = Color(0xffC2F2EF);
  static Color kyear = Color(0xff2B9BAB);
  static Color kratingbar = Color(0xff5D3AC2);

  static final TextStyle kAppTitle = TextStyle(
    color: Color(0xffC2F2EF),
    fontFamily: GoogleFonts.revalia(fontSize: 28).fontFamily
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