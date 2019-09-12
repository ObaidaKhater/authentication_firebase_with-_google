import 'package:flutter/material.dart';
import 'package:flutter_sign_in_with_google/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuthintication _firebaseAuthintication = FirebaseAuthintication();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firebaseAuthintication.currentUser();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controllerEmail,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _controllerPassword,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              RaisedButton(
                  child: Text('SignIn'),
                  onPressed: () async {
                    String email = _controllerEmail.text;
                    String password = _controllerPassword.text;
                    await _firebaseAuthintication.signIn(email, password);
                  }),

              RaisedButton(child: Text('SignOut'), onPressed: () async{
                await _firebaseAuthintication.signOut();
              }),

              RaisedButton(child: Text('Register'), onPressed: ()async {
                String email = _controllerEmail.text;
                String password = _controllerPassword.text;
                await _firebaseAuthintication.register(email, password);
              }),

              FloatingActionButton(
                elevation: 20,
                onPressed: () async {
                  await _firebaseAuthintication.signInWithGoogle();
                },
                child: Icon(
                  FontAwesomeIcons.signInAlt,
                  color: Colors.orange[300],
                ),
                backgroundColor: Colors.grey,
              ),
              SizedBox(height: 10),
              Text('SignIn With Google')
            ],
          ),
        ),
      ),
    );
  }
}
