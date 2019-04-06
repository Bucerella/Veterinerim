import 'package:flutter/material.dart';

class VetQuestion extends StatefulWidget {
  @override
  _VetQuestionState createState() => _VetQuestionState();
}

class _VetQuestionState extends State<VetQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SORULAR",
        style: TextStyle(
          fontFamily: "Pop",
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff21cdc0),
      ),
    );
  }
}
