import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternote/screens/note_list.dart';
import 'package:flutternote/widgets/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:mynotes/pages/homepage.dart';
class AuthService {

  GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');



  // changing return type to void
  // as bool was not needed here
  void signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);

        final User user = authResult.user;

        var userData = {
          'name': googleSignInAccount.displayName,
          'provider': 'google',
          'photoUrl': googleSignInAccount.photoUrl,
          'email': googleSignInAccount.email,
        };

        users.doc(user.uid).get().then((doc) {
          if (doc.exists) {
            // old user
            doc.reference.update(userData);

            Navigator.pushReplacementNamed(context, NoteApp.routeName);
          } else {
            // new user

            users.doc(user.uid).set(userData);

            Navigator.pushReplacementNamed(context, NoteApp.routeName);
          }
        });
      }
    } catch (PlatformException) {
      print(PlatformException);
      print("Sign in not successful !");
      // better show an alert here
    }
  }

  Future signOut() async {
    try {
      return await googleSignIn.disconnect();
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}