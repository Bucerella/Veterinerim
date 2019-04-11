import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/model/vaccine.dart';

class VaccineAdd extends StatefulWidget {
  final Map animalDetails;

  VaccineAdd(this.animalDetails);

  @override
  _VaccineAddState createState() => _VaccineAddState();

}

class _VaccineAddState extends State<VaccineAdd> {
  DateTime dateTime = DateTime.now();
  void handleNewDate(date) {
    print("handleNewDate ${date}");
    dateTime = date;
    setState(() {

    });

  }
  TextEditingController _vaccineNameController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

 int vetId;

  loadData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      vetId = sharedPreferences.getInt("id");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
    print("$vetId");
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
        child: SingleChildScrollView(
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
                          controller: _vaccineNameController,
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
                          controller: _detailController,
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
                  onPressed: () async {

                    Vaccine vaccine = Vaccine();
                    vaccine.animalId = widget.animalDetails["id"];
                    vaccine.userId = widget.animalDetails["userId"];
                    vaccine.vaccineDate = dateTime.toString().substring(0,19);
                    vaccine.vetId = widget.animalDetails["vetId"];
                    vaccine.vaccineName = _vaccineNameController.text;
                    vaccine.vaccineDetail = _detailController.text;

                    String result = await vaccineAdd(vaccine);
                    print(result);

                  },
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
