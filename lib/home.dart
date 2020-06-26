import 'package:ez_vote/homePage.dart';
import 'package:ez_vote/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ez_vote/pollOption.dart';

class Home extends StatefulWidget{
  const Home({
    Key key,
    this.user
  }):super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState()=> _HomeState();
}

class _HomeState extends State<Home>{
  int _index=0;
  @override

  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  Widget callPage(_index){
    switch(_index){
      case 0: return homePage();
      case 1: return pollOption();
      case 2: return Profile();

        break;
      default: return homePage();
    }
  }

/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: callPage(_index),

      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
        items: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.white,
            ),
          ),

          IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),

        ],
        onTap: (curentindex) {
          _index=curentindex;
          callPage(_index);
          setState(() {

          });
        },
      ),
    );
  }
}

