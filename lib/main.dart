import 'package:flutter/material.dart';
import 'package:oops/providers/countries.dart';
import 'package:oops/providers/phone_auth.dart';
import 'package:oops/screen/Home/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {  

  Widget build(BuildContext context) {
     
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> CountryProvider()),
      ChangeNotifierProvider(create: (context)=> PhoneAuthDataProvider())
    ],
     child: MaterialApp(
        home: Home(), //PhoneAuthGetPhone(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
