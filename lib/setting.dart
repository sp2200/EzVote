import 'package:flutter/material.dart';
import 'about.dart';
import 'feedback.dart';
import 'service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';


void main() {
  setupLocator();
  runApp(Setting());}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  Future <Login> _signOut()  async{
    await FirebaseAuth.instance.signOut();

    return new Login();
  }
  return ListView(
    children: <Widget>[
      SizedBox(
        height: 20,
      ),

      ListTile(
        title: Text('Edit Profile'),
        leading: Icon(Icons.edit),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('Profile');
        },
      ),

      SizedBox(
        height: 20,
      ),

      ListTile(
        title: Text('Feedback'),
        leading: Icon(Icons.feedback),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> FeedbackPage()),
          );
        },
      ),

      SizedBox(
        height: 20,
      ),

      ListTile(
        title: Text('About US'),
        leading: Icon(Icons.group),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> AboutPage()),
          );
        },
      ),

      SizedBox(
        height: 20,
      ),

      ListTile(
        title: Text('FAQ'),
        leading: Icon(Icons.message),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('FAQ');
        },
      ),

      SizedBox(
        height: 20,
      ),

      ListTile(
        title: Center(
  child: Text(
  'Log out',
  style: TextStyle(
  fontSize: 30,
  color: Colors.deepPurple,
  fontFamily: 'Poppins',
    fontWeight: FontWeight.w900,
  ),
  ),
  ),
        onTap: () {
          _signOut();
        },
      ),
    ],
  );
}