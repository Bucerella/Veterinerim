import 'package:flutter/material.dart';
import 'package:veterinerim/userpage/animals_add.dart';

class Animals extends StatefulWidget {
  @override
  _AnimalsState createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("HAYVANLARIM",
        style: TextStyle(
          fontSize: 25,
          fontFamily: "Pop",
          fontWeight: FontWeight.bold,
        ),
        )),
        backgroundColor: Color(0xff21cdc0),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            animalsCard(
                size, "images/dog_icon.png", "Saturu", "Bahar alerjisi"),
            animalsCard(
                size, "images/cat_icon.png", "Saturu", "Bahar alerjisi"),
            animalsCard(
                size, "images/turtle_icon.png", "Saturu", "Bahar alerjisi"),
            animalsCard(
                size, "images/hamster_icon.png", "Saturu", "Bahar alerjisi"),
            animalsCard(
                size, "images/bird_icon.png", "Saturu", "Bahar alerjisi"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff21cdc0),
          child: Icon(Icons.add),
          onPressed: () {
            var route = MaterialPageRoute(builder: (context) => AnimalsAdd());
            Navigator.push(context, route);
          }),
    );
  }
}

Widget animalsCard(Size size, icon, title, subtitle) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width - 30,
        child: ListTile(
          leading: Image.asset(
            "$icon",
            scale: 2,
          ),
          title: Text("$title",
          style: TextStyle(
            fontSize: 19,
            fontFamily: "Pop",
            fontWeight: FontWeight.bold,
          ),
          ),
          subtitle: Text("$subtitle",
          style: TextStyle(
            fontFamily: "Pop",
            fontWeight: FontWeight.w300,
          ),
          ),
        ),
      ),
    ),
    elevation: 3,
  );
}
