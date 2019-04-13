import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/userpage/animals.dart';
import 'package:veterinerim/userpage/appointment.dart';
import 'package:veterinerim/userpage/question.dart';

class UserPage extends StatefulWidget {
  final int id;
  final Map list;

  UserPage(this.id, this.list);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.list);
    var build = context;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 49,
              ),
              Container(
                width: size.width,
                height: 100,
                child: userPanel(widget.list,widget.id),
              ),
              SizedBox(
                height: 20,
              ),
              widget.list["status"] == 0
                  ? Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          padding: EdgeInsets.all(10.0),
                          height: 80,
                          width: size.width - 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Veterinere kaydolmak için kodunuz:",
                                style: TextStyle(
                                  color: Color(0xff21cdc0),
                                  fontFamily: "Pop",
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.list["code"]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Pop",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    )
                  : SizedBox(),
              SizedBox(
                height: 15,
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
                child: menuCard(build, widget.list,widget.id),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget userPanel(list,id) {
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
        "Merhaba ${list["ad"]}",
        style: TextStyle(
          fontSize: 18,
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
              "Veteriner Randevusu",
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

Widget menuCard(context, list,id) {
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
                onTap: () async {
                   List animalsList = await getAnimalsList(id);

                      var route =
                      MaterialPageRoute(builder: (context) => Animals(id,animalsList));
                      Navigator.push(context, route);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          "images/dogcat.png",
                          height: 75,
                        )),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Hayvanlarım",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Serrat",
                              fontSize: 25),
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Buradan hayvanlarınızı ekleyip , aşılarını görebilirsiniz.",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Serrat",
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: Material(
          elevation: 5,
          color: list["status"] == 1 ? Color(0xff21cdc0) : Colors.grey,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.topRight,
            width: 225,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: list["status"] == 1
                  ? () async {
                      List getQues = await getQuestion(id);


                      var route = MaterialPageRoute(
                          builder: (context) => QuestionPage(getQues,id));
                      Navigator.push(context, route);
                    }
                  : () {

                showAlert(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "images/vetNew.png",
                        height: 75,
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Veterinere Sor",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pop",
                            fontSize: 25),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Buradan hayvanlarınızla ilgili veterinerinize soru sorabilirsiniz.",
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
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: Material(
          elevation: 5,
          color: list["status"] == 1 ? Color(0xff21cdc0) : Colors.grey,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.topRight,
            width: 225,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: list["status"] == 1
                  ? () {
                      var route =
                          MaterialPageRoute(builder: (context) => DatePicker());
                      Navigator.push(context, route);
                    }
                  : () {
                showAlert(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "images/randevu.png",
                        height: 75,
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Randevu Al",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pop",
                            fontSize: 25),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Buradan veterinerinizden uygun tarih ve saatlerde randevu alabilirsiniz.",
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

void showAlert(context) {
  var alert = AlertDialog(
    content: Text(
        "Şuan Randevu Al ve Veterinere Sor kısmı aktif değildir. Aktif olması için verilen kod ile veterinere kaydolmanız gerekmektedir."),
  title: Text("UYARI"),

  );
  showDialog(context: context, builder: (context){
    return alert;
  });
}
