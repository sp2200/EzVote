import 'package:ez_vote/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgotPW extends StatefulWidget {
  @override
  _forgotPW createState() => _forgotPW();
}

class _forgotPW extends State<forgotPW> {
  final _formkey=GlobalKey<FormState>();


  String _email;

  String validateEmail(value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Email Is Required';
    }
    else if(!regExp.hasMatch(value)){
      return 'Invalid Email';
    }
    else{
      return null;
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleforgotPW() async {
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        _auth.sendPasswordResetEmail(email: _email,);
        showSnackBar("Verify Email");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> Login()),
        );
      }catch(e){
        print(e.message);
      }
    }
  }

  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  showSnackBar(string){
    SnackBar mysnackbar = new SnackBar(
      content: Text(string),
      duration: Duration(seconds: 2),
      action: new SnackBarAction(label:'Cancel',textColor: Colors.deepPurple, onPressed:()=>print("OK Pressed")),
    );
    _scaffoldKey.currentState.showSnackBar(mysnackbar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
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
                          "Forgot Password ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Odachi',
                              fontSize: 60),
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
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.deepPurple[400]),
                  child: FlatButton(
                    child: Text(
                      "Send Request",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: ()=>{
                      _handleforgotPW(),
                    },
                  ),
                )),
            SizedBox(height: 40,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.deepPurple[400]),
                  child: FlatButton(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Login()),
                      );
                    },
                  ),
                )),

            /*Center(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  color: Colors.white,
                  child: Text("SIGN IN", style: TextStyle(color:Colors.purple,fontSize: 22 ,fontWeight: FontWeight.w700),),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Login()),
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
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

