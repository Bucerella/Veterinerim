import 'package:flutter/material.dart';
import 'package:veterinerim/veterinarypage/useranimals_detail.dart';

class UserAnimals extends StatefulWidget {
  @override
  _UserAnimalsState createState() => _UserAnimalsState();
}

class _UserAnimalsState extends State<UserAnimals> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Kişinin Hayvanları",
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
                size, "images/dog_icon.png", "Saturu", "Bahar alerjisi",context),
            animalsCard(
                size, "images/cat_icon.png", "Saturu", "Bahar alerjisi",context),
            animalsCard(
                size, "images/turtle_icon.png", "Saturu", "Bahar alerjisi",context),
            animalsCard(
                size, "images/hamster_icon.png", "Saturu", "Bahar alerjisi",context),
            animalsCard(
                size, "images/bird_icon.png", "Saturu", "Bahar alerjisi",context),
          ],
        ),
      ),

    );
  }
}

Widget animalsCard(Size size, icon, title, subtitle,context) {
  return InkWell(
    onTap: (){
      //var route = MaterialPageRoute(builder: (context) => AnimalsEdit());
      //Navigator.push(context, route);
    },
    child: InkWell(
      onTap: (){
        var route = MaterialPageRoute(builder: (context)=> UserAnimalDetail());
        Navigator.push(context, route);
      },
      child: Card(
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
      ),
    ),
  );
}
