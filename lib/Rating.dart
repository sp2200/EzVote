import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Rating extends StatefulWidget {
  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {

  bool _picon;
  bool _nicon;
  bool _licon;
  bool _aicon;
  bool _sicon;
  bool _bicon;
  bool _siicon;
  bool _ticon;
  bool _eicon;



  double _rating=5;

  String question='';
  String category=null;
  String pollDuration;
  String imageUrl=null;
  int RatingValue=5;

  String _currentUserEmail;

  bool durationvalidatedSuccessfully=false;
  bool questionvalidateSuccessfully=false;

  Map<String,dynamic> _finalData =Map();

  @override
  void initState() {
    super.initState();
    _picon=true;
    _nicon=true;
    _licon=true;
    _aicon=true;
    _sicon=true;
    _bicon=true;
    _siicon=true;
    _ticon=true;
    _eicon=true;

    currentUser();
  }

  void dispose() {

    super.dispose();
  }

  Future<void> addData()async{
    final _firestore=await(Firestore.instance.collection('Rating').document());
    _firestore.setData(_finalData).whenComplete(
            ()=>{
          showSnackBar("Poll Created Successfully"),
          Navigator.pop(context),
        }
    ).catchError((e)=>{print(e)});
  }

  void currentUser() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    _currentUserEmail=user.email;
    print( _currentUserEmail);
  }



  final _formkey=GlobalKey<FormState>();

  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();


  showSnackBar(string){
    SnackBar mysnackbar = new SnackBar(
      content: Text(string),
      duration: Duration(seconds: 2),
      action: new SnackBarAction(label:'Cancel',textColor: Colors.purple, onPressed:()=>print("OK Pressed")),
    );
    _scaffoldKey.currentState.showSnackBar(mysnackbar);
  }

  String validateQuestion(value){
    if(value.length == 0){
      showSnackBar('Question Is required');
      return null;
    }

    if(value.length>50){
      showSnackBar('Question Should Be Less Than 50');
      return null;
    }

    else {
      questionvalidateSuccessfully=true;
      return null;
    }
  }

  String validateDuration(value){

    if(value.isEmpty){
      durationvalidatedSuccessfully=true;
      return null;
    }

    else if(int.parse(value)>4){
      showSnackBar('Duration Should Be Less Than 5');
      return null;
    }

    else {
      durationvalidatedSuccessfully=true;
      return null;
    }
  }

  bool validateCategory(){
    print('Category $category');
    if(category==null){
      showSnackBar('Select Category');
      return false;
    }

    else {
      return true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body:Form(
          key: _formkey,
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
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                        ),
                        child: Row(
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
                              "Rating",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            IconButton(
                              icon:Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              ),
                                onPressed: ()=>{
                                  if(_formkey.currentState.validate()){
                                    if(validateCategory()==true&&durationvalidatedSuccessfully==true&&questionvalidateSuccessfully==true){
                                      _formkey.currentState.save(),
                                      _finalData={
                                        'Question':this.question,
                                        'Category':this.category,
                                        'RatingValue':this.RatingValue,
                                        'Poll Duration': this.pollDuration,
                                        'Image URL':this.imageUrl,
                                        'Created By':this._currentUserEmail,
                                      },
                                      addData(),
                                    },
                                  },
                                }
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Align(
                          alignment: Alignment.center,
                          child:Text(
                            "Question",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Poppins',
                            ),
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: EdgeInsets.fromLTRB(0,30,0,30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: TextFormField(
                            cursorColor: Colors.purple,
                            textAlign: TextAlign.center,
                            validator: (value)=>validateQuestion(value),
                            onSaved: (String val){question=val;},
                            decoration: InputDecoration(
                                hintText: "Enter Poll Question",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Align(
                          alignment: Alignment.center,
                          child:Text(
                            "Select a Category",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Poppins',
                            ),
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      CarouselSlider(
                        autoPlay: true,
                        height: 100,
                        reverse: false,
                        viewportFraction: 0.40,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        items: <Widget>[
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color:Color.fromRGBO(147,112,219,1),width: 2),
                                color: _picon ? null:Color.fromRGBO(147,112,219,1),
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child: _picon ? Image.asset('assets/icons/political.png',):Image.asset('assets/icons/politicalW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Political & Human Rights",style: TextStyle(color:_picon?Color.fromRGBO(147,112,219,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _picon = !_picon;
                                _picon?{category=null}:{_nicon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='Political & Human Rights',};
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 2),
                                color: _nicon?null:Colors.grey,
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child: _nicon? Image.asset('assets/icons/news.png',):Image.asset('assets/icons/newsW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("News & Current Events",style: TextStyle(color:_nicon?Colors.grey:Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _nicon = !_nicon;
                                _nicon?{category=null}:{ _picon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='News & Current Events',};
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 103, 129,1),width: 2),
                                color: _licon?null:Color.fromRGBO(255, 103, 129,1),
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child:_licon?Image.asset('assets/icons/lifestyle.png',):Image.asset('assets/icons/lifestyleW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Lifestyle & Health",style: TextStyle(color:_licon?Color.fromRGBO(255, 103, 129,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _licon = !_licon;
                                _licon?{category=null}:{_picon=true,
                                  _nicon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='Lifestyle & Health',};

                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 69, 0,1),width: 2),
                                color: _aicon?null:Color.fromRGBO(255, 69, 0,1),
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child:_aicon? Image.asset('assets/icons/art.png',):Image.asset('assets/icons/artW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Arts & Entertainment",style: TextStyle(color:_aicon?Color.fromRGBO(255, 69, 0,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _aicon = !_aicon;
                                // ignore: unnecessary_statements
                                _aicon?{category=null}:{
                                  _picon=true,
                                  _nicon=true,
                                  _licon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='Arts & Entertainment',
                                };
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromRGBO(255, 213, 0,1),width: 2),
                                  color: _sicon?null:Color.fromRGBO(255, 213, 0,1)
                              ),
                              child: ListView(
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child:_sicon? Image.asset('assets/icons/sport.png',):Image.asset('assets/icons/sportW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Sport, Hobbies  & Games",style: TextStyle(color: _sicon?Color.fromRGBO(255, 213, 0,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _sicon = !_sicon;
                                _sicon?{category=null}:{
                                  _picon=true,
                                  _nicon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='Sport, Hobbies  & Games',
                                };
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(112, 225, 225,1),width: 2),
                                color: _bicon?null:Color.fromRGBO(112, 225, 225,1),
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child: _bicon ?Image.asset('assets/icons/business.png',):Image.asset('assets/icons/businessW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Business & Finance",style: TextStyle(color:_bicon?Color.fromRGBO(112, 225, 225,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _bicon = !_bicon;
                                _bicon?{category=null}:{
                                  _picon=true,
                                  _nicon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='Business & Finance',
                                };
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(50, 205, 50,1),width: 2),
                                color: _siicon?null:Color.fromRGBO(50, 205, 50,1),
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child:_siicon? Image.asset('assets/icons/science.png',):Image.asset('assets/icons/scienceW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Science & Nature",style: TextStyle(color:_siicon?Color.fromRGBO(50, 205, 50,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _siicon = !_siicon;
                                _siicon?{category=null}:{
                                  _picon=true,
                                  _nicon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _ticon=true,
                                  _eicon=true,
                                  category='Science & Nature',
                                };
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromRGBO(250,128,114,1),width: 2),
                                  color: _ticon?null:Color.fromRGBO(250,128,114,1)
                              ),
                              child: ListView(
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child: _ticon?Image.asset('assets/icons/technology.png',):Image.asset('assets/icons/technologyW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Technology & Gadgets",style: TextStyle(color:_ticon?Color.fromRGBO(250,128,114,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _ticon = !_ticon;
                                _ticon?{category=null}:{
                                  _picon=true,
                                  _nicon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _eicon=true,
                                  category='Technology & Gadgets',
                                };
                              })
                            },
                          ),
                          InkWell(
                            child: Container(
                              /*width: MediaQuery.of(context).size.width,*/
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(83, 140, 198,1),width: 2),
                                color: _eicon?null:Color.fromRGBO(83, 140, 198,1),
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                children: <Widget>[
                                  Align(alignment: Alignment.center,child:_eicon? Image.asset('assets/icons/everything.png',):Image.asset('assets/icons/everythingW.png',),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(alignment: Alignment.center,child: Text("Everything Else",style: TextStyle(color:_eicon?Color.fromRGBO(83, 140, 198,1):Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),),
                                ],
                              ),
                            ),
                            onTap: ()=>{
                              setState(() {
                                _eicon = !_eicon;
                                _eicon?{category=null}:{
                                  _picon=true,
                                  _nicon=true,
                                  _licon=true,
                                  _aicon=true,
                                  _sicon=true,
                                  _bicon=true,
                                  _siicon=true,
                                  _ticon=true,
                                  category='Everything Else',

                                };
                              })
                            },
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Align(
                          alignment: Alignment.center,
                          child:Text(
                            "Rating",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Poppins',
                            ),
                          )
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //////////////////////////////////////////////////////////

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: FluidSlider(
                          value: _rating,
                          onChanged: (double newValue) {
                            setState(() {
                              _rating = newValue;
                              print(_rating.toInt());
                            });
                          },
                          min: 0.0,
                          max: 10.0,
                          /*onChangeStart: (),*/
                          sliderColor: Color.fromRGBO(92, 37, 141,0.5),
                          thumbColor: Colors.amber[400],
                          start: Icon(
                            Icons.thumb_down,
                            color: Colors.white,
                          ),
                          end: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                        ),
                      ),



                      SizedBox(
                        height: 30,
                      ),


                      Align(
                          alignment: Alignment.center,
                          child:Text(
                            "Poll Duration",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Poppins',
                            ),
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: TextFormField(
                            cursorColor: Colors.purple,
                            textAlign: TextAlign.center,
                            validator: (value)=>validateDuration(value),
                            onSaved: (String val){pollDuration=val;},
                            decoration: InputDecoration(
                                hintText: "Days",
                                contentPadding: EdgeInsets.fromLTRB(60.0, 10.0, 20.0, 10.0),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.access_time,color: Colors.purple,),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Align(
                          alignment: Alignment.center,
                          child:Text(
                            "Image URL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Poppins',
                            ),
                          )
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: TextFormField(
                            cursorColor: Colors.purple,
                            textAlign: TextAlign.center,
                            onSaved: (val)=>{imageUrl=val},
                            decoration: InputDecoration(
                                hintText: "Paste image url from web",
                                contentPadding: EdgeInsets.fromLTRB(70.0, 10.0, 20.0, 10.0),
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.link,color: Colors.purple,),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 100,vertical: 25),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(30, 152, 136,1),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Create Poll',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Poppins",
                                  fontSize: 19,
                                ),
                              ),

                            ],
                          ),
                        ),
                        onTap: ()=>{
                          if(_formkey.currentState.validate()){
                            if(validateCategory()==true&&durationvalidatedSuccessfully==true&&questionvalidateSuccessfully==true){
                              _formkey.currentState.save(),
                              _finalData={
                              'Question':this.question,
                              'Category':this.category,
                              'RatingValue':this.RatingValue,
                              'Poll Duration': this.pollDuration,
                              'Image URL':this.imageUrl,
                              'Created By':this._currentUserEmail,
                              },
                              addData(),
                            },
                          },
                        }
                      )
                    ],
                  )
                ],

              ),
            ],
          ),
        )
    );
  }
}
