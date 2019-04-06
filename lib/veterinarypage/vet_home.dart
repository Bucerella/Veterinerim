import 'package:flutter/material.dart';
import 'package:veterinerim/veterinarypage/vet_animals.dart';
import 'package:veterinerim/veterinarypage/vet_appointment.dart';
import 'package:veterinerim/veterinarypage/vet_question.dart';

class VetHome extends StatefulWidget {
  @override
  _VetHomeState createState() => _VetHomeState();
}

class _VetHomeState extends State<VetHome> {
  @override
  Widget build(BuildContext context) {
    var build = context;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 49,
            ),
            Container(
              width: size.width,
              height: 100,
              child: userPanel(),
            ),
            Container(
              width: size.width - 20,
              height: size.height / 3,
              child: eventReminders(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: size.height / 3 * 2 - 170,
              child: menuCard(build),
            )
          ],
        ),
      ),
    );
  }
}

Widget userPanel() {
  return Row(
    children: <Widget>[
      SizedBox(
        width: 10,
      ),
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(image: AssetImage("images/buce.jpg")),
        ),
      ),
      SizedBox(
        width: 35,
      ),
      Text(
        "Merhaba Veteriner",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Pop",
        ),
      ),
    ],
  );
}

Widget eventReminders() {
  return Card(
    child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                size: 30,
                color: Color(0xff21cdc0),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Yaklaşan Etkinlikler",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: "Pop",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Randevular",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Pop",
                fontWeight: FontWeight.bold,
                color: Color(0xff21cdc0),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "16/04/2019 23:59 PM",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Pop",
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget menuCard(context) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: Material(
          elevation: 5,
          color: Color(0xff21cdc0),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.topRight,
            width: 225,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: (){
                var route = MaterialPageRoute(builder: (context) => VetAnimals());
                Navigator.push(context, route);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "images/dogcat.png",
                        height: 75,
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "ÜYELERİMİZ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Serrat",
                            fontSize: 25),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Buradan kişilerin, hayvanlarını ve uygulanan aşıları ekleyebilirsiniz.",
                      style: TextStyle(
                          color: Colors.white,
                            fontFamily: "Serrat",
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Padding (
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: Material(
          elevation: 5,
          color: Color(0xff21cdc0),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.topRight,
            width: 225,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: (){
                var route = MaterialPageRoute(builder: (context) => VetQuestion()

                );
                Navigator.push(context, route);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "images/vetNew.png",
                        height: 75,
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sorular",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Pop", fontSize: 25),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Buradan size sorulan soruları yanıtlayabilirsiniz.",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Pop", fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          var route = MaterialPageRoute(builder: (context) => CalendarViewApp());
          Navigator.push(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Material(
            elevation: 5,
            color: Color(0xff21cdc0),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.topRight,
              width: 225,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "images/randevu.png",
                        height: 75,
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Randevuları Gör",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Pop", fontSize: 25),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Buradan randevularınızı görebilirsiniz.",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Pop", fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}
