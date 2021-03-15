import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
    FirebaseUser user;
    Login({Key key, this.user}): super(key: key);
  
  @override
  _LoginState createState() => _LoginState();
 
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
   
    return Container(
      child: Text(this.widget.user.uid.toString()),
      color: Colors.white,
    );
  }
}
