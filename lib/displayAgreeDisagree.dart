import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_color/random_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class displayAgreeDisagree extends StatefulWidget {
  final String dID;
  displayAgreeDisagree(this.dID);
  @override
  _displayAgreeDisagree createState() => _displayAgreeDisagree(documentID: dID);
}

class _displayAgreeDisagree extends State<displayAgreeDisagree> {
  final String documentID;
  _displayAgreeDisagree({Key key, @required this.documentID});

  ScrollController _controller = new ScrollController();

  String _currentUserEmail='';

  bool available=false;

  Map<String,dynamic> _finalData=Map();

  var myFeedbackText = "Not Sure";
  var sliderValue = 2.0;
  IconData myFeedback = FontAwesomeIcons.meh;
  Color myFeedbackColor = Colors.red;

  void currentUser() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    _currentUserEmail=user.email;
    print( _currentUserEmail);
  }

  @override
  void initState(){
    super.initState();
    currentUser();
  }

  double _rating=5;

  int RatingValue=5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Form(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(92, 37, 141,1),
                      Color.fromRGBO(67, 137, 162,1),
                    ],
                  ),
                ),
              ),

              ListView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon:Icon(
                                Icons.keyboard_backspace,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: ()=>{
                                Navigator.pop(
                                    context
                                )
                              },
                            ),

                            Text(
                              "Agree/Disagree",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins',
                              ),
                            ),

                            IconButton(
                              icon:Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: ()=>{
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context)=>Search(),
                                    )
                                )
                              },
                            ),



                          ],
                        ),

                        SizedBox(
                          height: 30,
                        ),


                        StreamBuilder(
                            stream: Firestore.instance.collection('Agree_Disagree').document(documentID).snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return new Text("Loading");
                              }
                              var document = snapshot.data;

                              String _launchURL(document){
                                if (document==null) {
                                  return 'https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png';
                                } else {
                                  return document;
                                }
                              }

                              int noofOptions(Map mapExp) {
                                int counter=0;
                                mapExp.forEach((k,v) =>counter+=1);
                                return counter;
                              }

                              int formatTimestamp(Timestamp _stamp) {
                                if (_stamp != null) {
                                  var expDate=Timestamp(_stamp.seconds, _stamp.nanoseconds).toDate();
                                  var nowDate=DateTime.now();
                                  var temp=expDate.difference(nowDate);
                                  print(temp.inHours);
                                  return temp.inHours;
                                } else {
                                  return null;
                                }
                              }

                              Future<bool> checkUserVote()async{
                                print('1checkuserVote Called');
                                final _firestore=await(Firestore.instance.collection('Voted Poll').document(documentID).snapshots());
                                if(document['$_currentUserEmail']==true){
                                  print('2checkuserVote Called');
                                  return false;
                                }
                              }

                              Future<void> votePoll()async{
                                final _firestore=await(Firestore.instance.collection('Voted Poll').document(documentID));
                                print('votePoll Called');
                                // ignore: missing_return
                                _firestore.setData(_finalData).whenComplete(
                                        ()=>{checkUserVote()}
                                ).catchError((e)=>{print(e)});
                              }

                              Widget displayOptions(index){
                                Map disOptions=document['Options'];
                                int count=index+1;
                                String currentOp=disOptions['Option $count'];
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  children: <Widget>[
                                    InkWell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
                                          child: Center(
                                            child: Text(
                                              currentOp,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: '',
                                                  fontWeight: FontWeight.w900
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: RandomColor().randomColor(colorHue: ColorHue.purple, colorBrightness: ColorBrightness.light),
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                        ),
                                        onTap: ()=>{
                                          _finalData={
                                            // ignore: missing_return
                                            '$_currentUserEmail':true,
                                          },
                                          votePoll(),
                                        }
                                    ),

                                    SizedBox(
                                      height:10,
                                    )
                                  ],
                                );
                              }
                              return ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin:EdgeInsets.symmetric(horizontal: 30),
                                        padding:EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[

                                            //////////////////////////////////////////

                                            Text(
                                              'Question',
                                              style: TextStyle(
                                                fontSize: 23,
                                                color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                                fontFamily: 'Roboto-Black',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 4,
                                              width: 35,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                            ),

                                            //////////////////////////////////////////

                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              document['Question'],
                                              style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white,
                                                fontFamily: 'Roboto-Black',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),

                                            SizedBox(
                                              height: 30,
                                            ),

                                            Text(
                                              'Category',
                                              style: TextStyle(
                                                fontSize: 23,
                                                color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                                fontFamily: 'Roboto-Black',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 4,
                                              width: 35,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),

                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
                                              child: Text(
                                                document['Category'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: '',
                                                    fontWeight: FontWeight.w900
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: <Color>[
                                                      Color.fromRGBO(252, 70, 107,1).withOpacity(0.7),
                                                      Color.fromRGBO(63, 94, 251,1).withOpacity(0.7),
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(25)
                                              ),
                                            ),

                                            SizedBox(height:30,),

                                            Text(
                                              'Image URL',
                                              style: TextStyle(
                                                fontSize: 23,
                                                color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                                fontFamily: 'Roboto-Black',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 4,
                                              width: 35,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                            ),

                                            SizedBox(
                                              height: 15,
                                            ),

                                            InkWell(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
                                                child: Text(
                                                  'Open',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: '',
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: <Color>[
                                                        Color.fromRGBO(46, 191, 145,1),
                                                        Color.fromRGBO(131, 96, 195,1),
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius.circular(25)
                                                ),
                                              ),
                                              onTap: ()=>{launch(_launchURL(document['Image URL'])),},
                                            ),

                                            SizedBox(
                                              height: 30,
                                            ),

                                            Text(
                                              'Options',
                                              style: TextStyle(
                                                fontSize: 23,
                                                color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                                fontFamily: 'Roboto-Black',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 4,
                                              width: 35,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),


                                            Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Container(child: Text(
                                                myFeedbackText,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:'Poppins',
                                                ),
                                              )
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(child: Icon(
                                                myFeedback, color: myFeedbackColor, size: 70.0,)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Slider(
                                                  min: 0.0,
                                                  max: 4.0,
                                                  divisions: 4,
                                                  value: sliderValue,
                                                  activeColor: Color(0xffff520d),
                                                  inactiveColor: Colors.blueGrey,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      sliderValue = newValue;
                                                      if (sliderValue ==0) {
                                                        myFeedback = FontAwesomeIcons.sadTear;
                                                        myFeedbackColor = Colors.red;
                                                        myFeedbackText = "Strongly Disagree";
                                                      }
                                                      if (sliderValue == 1) {
                                                        myFeedback = FontAwesomeIcons.frown;
                                                        myFeedbackColor = Colors.yellow;
                                                        myFeedbackText = "Disagree";
                                                      }
                                                      if (sliderValue == 2) {
                                                        myFeedback = FontAwesomeIcons.meh;
                                                        myFeedbackColor = Colors.amber;
                                                        myFeedbackText = "Not Sure";
                                                      }
                                                      if (sliderValue == 3) {
                                                        myFeedback = FontAwesomeIcons.smile;
                                                        myFeedbackColor = Colors.green;
                                                        myFeedbackText = "Agree";
                                                      }
                                                      if (sliderValue ==4) {
                                                        myFeedback = FontAwesomeIcons.laugh;
                                                        myFeedbackColor = Color(0xffff520d);
                                                        myFeedbackText = "Strongly Agree";
                                                      }
                                                    });
                                                  },
                                                ),),
                                            ),

                                            SizedBox(
                                              height: 30,
                                            ),

                                            Icon(
                                              Icons.access_time,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                              size: 30,
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 4,
                                              width: 35,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  formatTimestamp(document['Poll Expire On']).toString(),
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                    color: Colors.white,
                                                    fontFamily: 'Roboto-Black',
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),

                                                Text(
                                                  ' Hours',
                                                  style: TextStyle(
                                                    fontSize: 26,
                                                    color: Colors.white,
                                                    fontFamily: 'Roboto-Black',
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),

                                              ],
                                            ),

                                            SizedBox(height: 30,),

                                            Icon(
                                              Icons.person_outline,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                              size: 30,
                                            ),

                                            SizedBox(
                                              height: 5,
                                            ),

                                            Container(
                                              height: 4,
                                              width: 35,
                                              color:Color.fromRGBO(46, 191, 145,1).withOpacity(0.7),
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),

                                            Text(
                                              document['Created By'],
                                              style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white,
                                                fontFamily: 'Roboto-Black',
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),





                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              );
                            }
                        ),


                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        )
    );
  }
}
