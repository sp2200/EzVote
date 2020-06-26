import 'package:ez_vote/forgotPW.dart';
import 'package:ez_vote/home.dart';
import 'package:ez_vote/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotPW.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final _formkey=GlobalKey<FormState>();


  String _email;
  String _pw;

  bool passwordVisible=false;
  bool obscuretextval=true;

  String validateEmail(value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      showSnackBar('Email Is Required');
      return null;
    }
    else if(!regExp.hasMatch(value)){
      showSnackBar('Invalid Email');
      return null;
    }
    else{
      return null;
    }
  }

  String validatePW(value){
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0){
      showSnackBar('Password Is Required');
      return null;
    }
    else if(!regExp.hasMatch(value)){
      showSnackBar('Invalid Password');
      return null;
    }

    else {
      return null;
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: _email, password: _pw)).user;
        print(user.isEmailVerified);
        /*
        if(user.isEmailVerified){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Home()),
          );
        }else{
          showSnackBar("First Verify Your Email");
        }*/
        return user;
      }catch(e){
        /*showSnackBar("Authentication Failed");
        print(e.message);*/
      }
    }
  }

  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  showSnackBar(string){
    SnackBar mysnackbar = new SnackBar(
      content: Text(string),
      duration: Duration(seconds: 2),
      action: new SnackBarAction(label:'Cancel',textColor: Colors.purple, onPressed:()=>print("OK Pressed")),
    );
    _scaffoldKey.currentState.showSnackBar(mysnackbar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Builder(builder: (context){
        return Form(
          key: _formkey,
          child:ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[

                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple[500].withOpacity(0.3),
                                Colors.deepPurple[300].withOpacity(0.3),
                              ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple[500].withOpacity(0.1),
                                Colors.deepPurple[300].withOpacity(0.1),
                              ]
                          )),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      child: Column(
                        children: <Widget>[

                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "LOG IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Odachi',
                                fontSize: 80),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 300,


                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple[500],
                              Colors.deepPurple[400],
                              Colors.deepPurple[300],
                            ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextFormField(
                    validator: (value)=>validateEmail(value),
                    onSaved: (String val){_email = val;},
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.email,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextFormField(
                    obscureText: obscuretextval,
                    validator: (value)=>validatePW(value),
                    onSaved: (value)=>{_pw=value,},
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color:Colors.deepPurple /*Theme.of(context).primaryColorDark*/,
                          ),
                          onPressed: () {

                            setState(() {
                              passwordVisible = !passwordVisible;
                              obscuretextval=!obscuretextval;
                            });
                          },
                        ),
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.lock,
                            color: Colors.deepPurple,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.deepPurple[400]),
                    child: FlatButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      onPressed: ()=>{
                        _handleSignIn(),
                        /*if(_formkey.currentState.validate()){
                        _formkey.currentState.save(),
                        print("Email $email"),
                        print("Pw $pw"),
                      }*/
                      },
                    ),
                  )),
              SizedBox(height: 20,),
              Center(
                child: InkWell(
                  child: Text("FORGET PASSWORD ?", style: TextStyle(color:Colors.deepPurple,fontSize: 16 ,fontWeight: FontWeight.w700),),
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>forgotPW())
                    );
                  },
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an Account ? ", style: TextStyle(color:Colors.black,fontSize: 14 ,fontWeight: FontWeight.normal),),
                  InkWell(
                    child:Text("Sign Up ",
                        style: TextStyle(
                          color:Colors.deepPurple,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }


}

