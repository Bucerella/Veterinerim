import 'package:flutter/material.dart';
import 'package:veterinerim/veterinarypage/vaccine_add.dart';
import 'package:veterinerim/veterinarypage/vaccine_edit.dart';

class UserAnimalDetail extends StatefulWidget {
  final Map animalMap;


  UserAnimalDetail(this.animalMap);

  @override
  _UserAnimalDetailState createState() => _UserAnimalDetailState();
}

class _UserAnimalDetailState extends State<UserAnimalDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Container(
                    child: Image.asset(
                      "${getPathFromId(widget.animalMap["type"])}",
                      width: 70,
                      height: 70,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "${widget.animalMap["name"]}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pop",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 5,
            child: Container(
              width: size.width - 50,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      gradient: LinearGradient(colors: [
                        Color(0xFF21CDC0),
                        Color(0xFF21CD90),
                      ]),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Pet Healty Overview",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pop",
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${widget.animalMap["age"]} Yaşında",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Kilo: ${widget.animalMap["weight"]} ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                        widget.animalMap["gender"] == 5 ? "Erkek":"Dişi",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sonraki aşı 10 gün sonra",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(
                          "images/heart_beat.png",
                          scale: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 5,
            child: Container(
              width: size.width - 50,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      gradient: LinearGradient(colors: [
                        Color(0xFF21CDC0),
                        Color(0xFF21CD90),
                      ]),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Uygulanan Aşılar",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pop",
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (context) => VaccineAdd());
                            Navigator.push(context, route);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "01/03/2014",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "2 Yaş",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              var route = MaterialPageRoute(builder: (context) => VaccineEdit());
                              Navigator.push(context, route);
                            },
                            child:
                            Icon(Icons.build)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "01/03/2014",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "2 Yaş",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Pop",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            var route = MaterialPageRoute(builder: (context) => VaccineEdit());
                            Navigator.push(context, route);
                          },
                            child:
                            Icon(Icons.build)),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "images/vaccine_icon.png",
                        scale: 8,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
String getPathFromId(int id) {
  if (id == 0) {
    return "images/cat_icon.png";
  } else if (id == 1) {
    return "images/bird_icon.png";
  } else if (id == 2) {
    return "images/dog_icon.png";
  } else if (id == 3) {
    return "images/turtle_icon.png";
  } else {
    return "images/hamster_icon.png";
  }
}


