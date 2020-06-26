import 'package:ez_vote/displayAgreeDisagree.dart';
import 'package:ez_vote/displayMultiple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'displayRating.dart';
import 'search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'displayAB.dart';
class homePage extends StatefulWidget {
  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<homePage> {
  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            icon: new Icon(Icons.apps,size: 34,),
            onPressed: () => _scaffoldKey.currentState.openDrawer()
        ),
        title: Text(
          "Ezvote",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontFamily: "Roboto-Black",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
            ),
            onPressed: ()=>{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>Search(),
                  )
              )
            },
          )
        ],
      ),
      key: _scaffoldKey,

      drawer: Drawer(

      ),

      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          
          
          CarouselSlider(
            autoPlay: true,
            height: 140,
            reverse: false,
            viewportFraction: 0.40,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(milliseconds: 1000),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            pauseAutoPlayOnTouch: Duration(milliseconds: 100),
            scrollDirection: Axis.horizontal,
            items: <Widget>[
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color:Color.fromRGBO(147,112,219,1),width: 2),
                    color: Color.fromRGBO(147,112,219,1),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                      height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/politicalW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Political & Human Rights",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 2),
                    color:Colors.grey,
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child: Image.asset('assets/icons/newsW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("News & Current Events",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 103, 129,1),width: 2),
                    color:Color.fromRGBO(255, 103, 129,1),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/lifestyleW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Lifestyle & Health",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 69, 0,1),width: 2),
                    color:Color.fromRGBO(255, 69, 0,1),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/artW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Arts & Entertainment",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(255, 213, 0,1),width: 2),
                      color: Color.fromRGBO(255, 213, 0,1)
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/sportW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Sport, Hobbies  & Games",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(112, 225, 225,1),width: 2),
                    color:Color.fromRGBO(112, 225, 225,1),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/businessW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Business & Finance",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(50, 205, 50,1),width: 2),
                    color: Color.fromRGBO(50, 205, 50,1),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/scienceW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Science & Nature",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(250,128,114,1),width: 2),
                      color:Color.fromRGBO(250,128,114,1)
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/technologyW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Technology & Gadgets",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
              InkWell(
                child: Container(
                  /*width: MediaQuery.of(context).size.width,*/
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(83, 140, 198,1),width: 2),
                    color:Color.fromRGBO(83, 140, 198,1),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(alignment: Alignment.center,child:Image.asset('assets/icons/everythingW.png',),),
                      SizedBox(
                        height: 5,
                      ),
                      Align(alignment: Alignment.center,child: Text("Everything Else",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                    ],
                  ),
                ),
                onTap: ()=>{
                },
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),

      ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('Multiple Options').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');

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

              String noOFVOTES(Map mapExp) {
                int counter=0;
                /*print(mapExp);*/
                mapExp.forEach((k,v) =>counter+=v);
                print(counter);
                return counter.toString();
              }


              return new ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return Column(
                    children: <Widget>[
                      Card(
                        color: Colors.deepPurple.withOpacity(0.6),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    document['Question'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins'
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.fromLTRB(0,10,0,0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Image(
                                      width: 18,
                                      image: AssetImage(
                                        'assets/icons/multipleoptions.png',
                                      ),
                                    ),

                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.access_time,color:Colors.white,size: 20,),

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            formatTimestamp(document['Poll Expire On']).toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          Text(
                                            " Hours",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.check_circle,color: Colors.white,size: 20,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            noOFVOTES(document['OptionsValue']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                              onTap: ()=>{
                                print(document.documentID),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>displaymultiple(document.documentID))
                                )
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15 ,
                      )
                    ],
                  );
                }).toList(),

              );
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('AB').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');

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

              String noOFVOTES(Map mapExp) {
                int counter=0;
                /*print(mapExp);*/
                mapExp.forEach((k,v) =>counter+=v);
                print(counter);
                return counter.toString();
              }


              return new ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return Column(
                    children: <Widget>[
                      Card(
                        color: Colors.deepPurple.withOpacity(0.6),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    document['Question'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins'
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.fromLTRB(0,10,0,0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Image(
                                      width: 18,
                                      image: AssetImage(
                                        'assets/icons/ab.png',
                                      ),
                                    ),

                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.access_time,color:Colors.white,size: 20,),

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            formatTimestamp(document['Poll Expire On']).toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          Text(
                                            " Hours",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.check_circle,color: Colors.white,size: 20,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            noOFVOTES(document['OptionsValue']),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                              onTap: ()=>{
                                print(document.documentID),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>displayAB(document.documentID))
                                )
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15 ,
                      )
                    ],
                  );
                }).toList(),

              );
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('Rating').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');

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

              String noOFVOTES(Map mapExp) {
                int counter=0;
                /*print(mapExp);*/
                mapExp.forEach((k,v) =>counter+=v);
                print(counter);
                return counter.toString();
              }


              return new ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return Column(
                    children: <Widget>[
                      Card(
                        color: Colors.deepPurple.withOpacity(0.6),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    document['Question'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins'
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.fromLTRB(0,10,0,0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Image(
                                      width: 18,
                                      image: AssetImage(
                                        'assets/icons/rating.png',
                                      ),
                                    ),

                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.access_time,color:Colors.white,size: 20,),

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            formatTimestamp(document['Poll Expire On']).toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          Text(
                                            " Hours",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.check_circle,color: Colors.white,size: 20,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '10',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                              onTap: ()=>{
                                print(document.documentID),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>displayRating(document.documentID))
                                )
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15 ,
                      )
                    ],
                  );
                }).toList(),

              );
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('Agree_Disagree').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return new Text('Loading...');

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

              String noOFVOTES(Map mapExp) {
                int counter=0;
                /*print(mapExp);*/
                mapExp.forEach((k,v) =>counter+=v);
                print(counter);
                return counter.toString();
              }


              return new ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return Column(
                    children: <Widget>[
                      Card(
                        color: Colors.deepPurple.withOpacity(0.6),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    document['Question'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Poppins'
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.fromLTRB(0,10,0,0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Image(
                                      width: 18,
                                      image: AssetImage(
                                        'assets/icons/agreedisagree.png',
                                      ),
                                    ),

                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.access_time,color:Colors.white,size: 20,),

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            formatTimestamp(document['Poll Expire On']).toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          Text(
                                            " Hours",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.check_circle,color: Colors.white,size: 20,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '23',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 14
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isThreeLine: true,
                              onTap: ()=>{
                                print(document.documentID),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>displayAgreeDisagree(document.documentID))
                                )
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15 ,
                      )
                    ],
                  );
                }).toList(),

              );
            },
          ),
        ],
      )
    ]
      ),


    );
  }

}