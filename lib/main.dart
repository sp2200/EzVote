import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verifyACC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _HandleAuth()
    );
  }
}

Widget _HandleAuth(){
  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: Text("Loading...",style: TextStyle(color: Colors.purple,fontSize: 40,fontFamily: "Pacifico"),),);
      }
      else{

        if(snapshot.hasData){
          return Home();
        }

        else{
          return Login();
        }
      }
    },
  );
}


/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  int counter=0;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,

      duration: new Duration(milliseconds: 500),
    );
    animationController.forward();
    @override
    void dispose() {
      animationController.dispose();
      super.dispose();
    }
  }

  Widget _HandleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: Text("Loading...",style: TextStyle(color: Colors.purple,fontSize: 40,fontFamily: "Pacifico"),),);
        }
        else{

          if(snapshot.connectionState == snapshot.hasData){
            return Home();
          }

          else{
            return Login();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
          children: <Widget>[
            new InkWell(
              child: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/bg16.png"), fit: BoxFit.cover,),
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _HandleAuth()),
                );
              }
            ),

            new Align(
              alignment: Alignment.bottomCenter,
              child: new Text(
                "WELCOME HERE",
                style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.bold),
              ),
            ),

            RotationTransition(
              turns: Tween(begin: 0.0, end: 2.0).animate(animationController),
              child: Opacity(
                opacity:1,
                child: new  Align(
                    alignment: Alignment.center,
                    child:  Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "EzVote",
                        style:TextStyle(
                          color: */
/*Color(0xffff3a5a)*//*
Colors.white.withOpacity(1),
                          fontSize:100,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Odachi',
                        ),
                      ),
                    )
                ),
              ),
            ),

          ],
        )
    );
  }
}
*/
