import 'package:flutter/material.dart';
import 'dart:convert' show json;

void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(primaryColor: Colors.amber),
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('load Json'),
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('localjson/person.json'),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());
            return new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      new Text("Name :" + mydata[index]['name']),
                      new Text("Phone :" + mydata[index]['phone']),
                      new Text("Location :" + mydata[index]['location']),
                      new Text("Status :" + mydata[index]['status'])
                    ],
                  ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
            );
          },
        )),
      ),
    );
  }
}
