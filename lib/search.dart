import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';

void main() => runApp(new Search());

class Search extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
    ),
    home: new SearchState(title: 'Search'),
    );
  }
}

class SearchState extends StatefulWidget {
  SearchState({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySearchState createState() => new _MySearchState();
}

class _MySearchState extends State<SearchState> {
  TextEditingController editingController = TextEditingController();
  String _animationName = "Flight";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  /*filterSearchResults(value);*/
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),

            Expanded(
              child: Stack(children: <Widget>[
                Center(
                  child:Container(
                      height:400,
                      child: NimaActor("assets/flare/robot1.nma",
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        animation: _animationName,
                      )),
                )
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}