import 'package:bankapp/components/halamanutama.dart';
import 'package:bankapp/components/signin.dart';
import 'package:bankapp/components/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final welcome = './welcome';
  static final sign = './signin';
  static final dashbord = './halamanutama';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home:  SignIn(),
      routes: {
        './signin': (context) => SignIn(),
        './halamanutama': (context) => Chatapp(),
        './welcome': (context) => Welcome()
      },
    );
  }
}
