import 'package:flutter/material.dart';

class placesDiscover extends StatefulWidget {
  const placesDiscover();

  @override
  _placesDiscoverState createState() => _placesDiscoverState();
}

class _placesDiscoverState extends State<placesDiscover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Descobrir Lugares"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Descobrir Lugares",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
