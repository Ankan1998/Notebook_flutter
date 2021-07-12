import 'package:flutter/material.dart';
import 'package:flutternote/services.dart/google_auth.dart';


class LoginPage extends StatefulWidget {
  static final String routeName = "/login";

  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "images/note.png",
                    ),
                  ),
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 12.0,
              ),
              child: Text(
                "Manage Reminder",
                style: TextStyle(
                  fontSize: 30.0,
                  //fontFamily: "lato",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  _auth.signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue With Google",
                      style: TextStyle(
                        fontSize: 20.0,
                        //fontFamily: "lato",
                      ),
                    ),
                    //
                    SizedBox(
                      width: 10.0,
                    ),
                    //
                    Image.asset(
                      'images/download.png',
                      height: 36.0,
                    ),
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey[700],
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    )),
              ),
            ),
            //
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}