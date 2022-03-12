import 'package:bankapp/components/halamanutama.dart';
import 'package:flutter/material.dart';
import '../main.dart';

String name = '';
String password = '';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _controller = TextEditingController();
  final _control = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Username can\'t be empty';
    }
    else if (text.length < 4) {
      return 'Username atleast 5 charachter';
    }
    // return null if the text is valid
    return null;
  }
  String? get _texterror {
    // at any time, we can get the text from _controller.value.text
    final script = _control.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (script.isEmpty) {
      return 'Password can\'t be empty';
    }
    else if (script.length < 5) {
      return 'Password atleast 6 character';
    }
    // return null if the text is valid
    return null;
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Log In'),
          ),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: (EdgeInsets.all(20)),
                        child: Text(
                          "Login New Account",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  TextField(
                    controller: _controller,
                    autocorrect: true,
                    onSubmitted: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                        errorText: _errorText,
                        // icon:Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person_add)),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextField(
                    controller: _control,
                    autocorrect: true,
                    obscureText: true,
                    onSubmitted: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                        errorText: _texterror,
                        // icon:Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.password)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.dashbord);
                      },
                      child: Text("Sign In"))
                ],
              )),
        ]),
      ),
    );
  }
}
