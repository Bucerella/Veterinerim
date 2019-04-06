import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class VaccineEdit extends StatefulWidget {
  @override
  _VaccineEditState createState() => _VaccineEditState();
}

class _VaccineEditState extends State<VaccineEdit> {
  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }

  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _textEditingController2 = new TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _textEditingController.text = "KUDUZ";
  _textEditingController2.text = "anan vurdu";
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff21cdc0),
        title: Text(
          "AŞI",
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
            Text(
              "Aşı bilgilerini giriniz:",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff21cdc0),
                fontFamily: "Pop",
                fontWeight: FontWeight.bold,
              ),
            ),
            Calendar(
              onSelectedRangeChange: (range) =>
                  print("Range is ${range.item1}, ${range.item2}"),
              onDateSelected: (date) => handleNewDate(date),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Material(elevation: 4 ,
                  child: CustomPaint(
                    painter: DrawRectangle(),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 75,
                      width: 75,
                      child: Image.asset("images/asi_icon.png"),
                    ),
                  ),
                ),
                Flexible(
                  child: Material(
                    elevation: 4,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      height: 75,
                      child: TextField(
                        controller: _textEditingController,
                        textAlign: TextAlign.center,
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
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Material(elevation: 4 ,
                  child: CustomPaint(
                    painter: DrawRectangle(),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 75,
                      width: 75,
                      child: Image.asset("images/detail_icon.png"),
                    ),
                  ),
                ),
                Flexible(
                  child: Material(
                    elevation: 4,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      height: 75,
                      child: TextField(
                        controller: _textEditingController2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Pop",
                        ),
                        decoration: InputDecoration(
                          hintText: "Yapılan aşının detaylarını  giriniz...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
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
