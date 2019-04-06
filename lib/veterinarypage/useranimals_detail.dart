import 'package:flutter/material.dart';
import 'package:veterinerim/veterinarypage/vaccine_add.dart';

/*
class UserAnimalsDetail extends StatefulWidget {
  @override
  _UserAnimalsDetailState createState() => _UserAnimalsDetailState();
}

class _UserAnimalsDetailState extends State<UserAnimalsDetail> {
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _textEditingController2 = new TextEditingController();
  TextEditingController _textEditingController3 = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text = "Saturu";
    _textEditingController2.text = "Saturuku alerjisi vardır.";
    _textEditingController3.text = "99.9";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff21cdc0),
        title: Center(
            child: Text(
          "KİKİ BİLGİLERİ",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Robot",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Hayvan bilgileri:",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff21cdc0),
                      fontFamily: "Robot"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(size, "Hayvanınızın isimini giriniz.",
                  "images/paw.png", _textEditingController),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(size, "Hayvanınızın alerjilerini giriniz.",
                  "images/pills_5.png", _textEditingController2),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(size, "Hayvanınızın kilosunu giriniz",
                  "images/weight_2.png", _textEditingController3),
              SizedBox(
                height: 20,
              ),
              editCard(size, "KUDUZ 19/04/2019"),
              Container(
                padding: EdgeInsets.only(right: 15.0,bottom: 8.0),
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Color(0xff21cdc0),
                    onPressed: (){
                      var route = MaterialPageRoute(builder: (context) => VaccineAdd());
                      Navigator.push(context, route);
                    }

                    ),
              ),

              ],
          ),
        ),
      ),
    );
  }

  Widget animalsTextWidget(Size size, icerik, icon, editController) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Row(
        children: <Widget>[
          Material(
            elevation: 5,
            child: CustomPaint(
              painter: DrawRectangle(),
              child: Container(
                padding: EdgeInsets.all(15),
                height: 75,
                width: 75,
                child: Image.asset(
                  "$icon",
                ),
              ),
            ),
          ),
          Flexible(
            child: Material(
              elevation: 5,
              child: Container(
                color: Colors.white,
                width: size.width - 111,
                alignment: Alignment.center,
                height: 75,
                child: TextField(
                  controller: editController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "  $icerik",
                    hintStyle: TextStyle(
                      color: Color(0xffa6a6a6),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Pop",
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    paint.color = Color(0xFF21cdc0);

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Color(0xFF28f8e8);
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    // close the path to form a bounded shape
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

Widget editCard(Size size, asilar) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Container(
                alignment: Alignment.center,
                width: size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  gradient: LinearGradient(
                      colors: [Color(0xff21cdc0), Color(0xff28f8e8)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "UYGULANAN AŞILAR",
                    style: TextStyle(
                        fontFamily: "Pop", fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                width: size.width - 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "$asilar",
                    style: TextStyle(
                        fontFamily: "Pop", fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        Positioned(
            left: 5,
            top: 0,
            child: Image.asset(
              "images/question.png",
              scale: 3,
            )),
        Positioned(
            right: 5,
            bottom: 0,
            child: Image.asset(
              "images/answer.png",
              scale: 3,
            )),
      ],
    ),
  );
}
*/

class UserAnimalDetail extends StatefulWidget {
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
                      "images/cat_icon.png",
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
                  "Pet name",
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
                          "2 Yaş",
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
                          "2 Yaş",
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
                          "2 Yaş",
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
                        Icon(Icons.build),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Icon(Icons.build),
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
