import 'package:flutter/material.dart';

class VaccineAdd extends StatefulWidget {
  @override
  _VaccineAddState createState() => _VaccineAddState();
}

class _VaccineAddState extends State<VaccineAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff21cdc0),
        title: Text("AŞI",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Pop",
          color: Colors.white,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Aşı bilgilerini giriniz:",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xff21cdc0),
              fontFamily: "Pop",
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Pop",
                  ),
                  decoration: InputDecoration(
                    hintText: "Yapılan aşıyı giriniz...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

            Card(elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Pop",
                  ),
                  decoration: InputDecoration(
                    hintText: "Yapılan aşıyla ilgili bilgileri giriniz...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 300,
              color: Color(0xff21cdc0),
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: () {},

                child: Text(
                  "Kaydet",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontFamily: "Robot",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
