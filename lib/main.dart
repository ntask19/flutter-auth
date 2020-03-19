import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  Future<AuthResult> _signIn(String email, String password) async {
    email = email.trim();
    print("email is ${email}, password is ${password}");
    final AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
    print("User id is ${result.user.uid}");
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("ログイン"),
          content: Text("ログイン成功です"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: _layoutBody(),
    );
  }

  Widget _layoutBody() {
    return new Center(
      child: new Form(
        child: new SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              new TextFormField(
                controller: emailInputController,
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 24.0),
              new TextFormField(
                controller: passwordInputController,
                decoration: new InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              new Center(
                child: new RaisedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    var email = emailInputController.text;
                    var password = passwordInputController.text;
                    return _signIn(email, password)
                      .then((AuthResult result) => print(result.user))
                      .catchError((e) => print(e));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

