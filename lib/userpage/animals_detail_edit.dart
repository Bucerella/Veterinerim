import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/model/animals_model.dart';

class AnimalsEdit extends StatefulWidget {
    final Map animal;

    AnimalsEdit(this.animal);

    @override
    _AnimalsEditState createState() => _AnimalsEditState();
}

class _AnimalsEditState extends State<AnimalsEdit> {

  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _allergicEditingController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _ageEditingController = new TextEditingController();
  var type=0;
  var gender = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.animal);
    _nameEditingController.text = "${widget.animal["name"]}";
    type = widget.animal["type"];
    gender = widget.animal["gender"];
    _allergicEditingController.text = "${widget.animal["allergic"]}.";
    _weightController.text = "${widget.animal["weight"]}";
    _ageEditingController.text = "${widget.animal["age"]}";
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
          "HAYVANLARIM",
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
                  "Hayvan bilgilerini değiştiriniz :",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff21cdc0),
                      fontFamily: "Robot"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  animalsIcon("cat_icon", "Kedi", 0,type),
                  animalsIcon("bird_icon", "Kuş", 1,type),
                  animalsIcon("dog_icon", "Köpek", 2,type),
                  animalsIcon("turtle_icon", "Kaplumbağa", 3,type),
                  animalsIcon("hamster_icon", "Hamster", 4,type),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  animalsIcon("male_icon", "Erkek", 5,gender),
                  animalsIcon("female_icon", "Kadın", 6,gender)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(
                  size, "Hayvanınızın isimini giriniz.", "images/paw.png", _nameEditingController),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(size, "Hayvanınızın alerjilerini giriniz.",
                  "images/pills_5.png", _allergicEditingController),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(size, "Hayvanınızın kilosunu giriniz",
                  "images/weight_2.png", _weightController),
              SizedBox(
                height: 15,
              ),
              animalsTextWidget(size, "Hayvanınızın yaşını giriniz",
                  "images/weight_2.png", _ageEditingController),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 300,
                color: Color(0xff21cdc0),
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () async {
                    Animals editAnimal = Animals();
                    editAnimal.id = widget.animal["id"];
                    editAnimal.userId = widget.animal["userId"];
                    editAnimal.gender = gender;
                    editAnimal.type = type;
                    editAnimal.name = _nameEditingController.text;
                    editAnimal.allergic = _allergicEditingController.text;
                    editAnimal.age = int.parse(_ageEditingController.text);
                    editAnimal.weight = _weightController.text;

                    String edit = await editAnimals(editAnimal);
                    if(edit == "200"){
                      Navigator.pop(context,{"status":"succes"});
                    }
                    print(edit);

                  },
                  child: Text(
                    "Düzenle",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: "Robot",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ),
              editCard(size,"KUDUZ 19/04/2019"),
            ],
          ),
        ),
      ),
    );
  }
  Widget animalsIcon(path, type, id,selected) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 30.0),
          child: Opacity(
            opacity: selected == id ? 0.5 : 1,
            child: Container(
              child: Image.asset("images/$path.png"),
              padding: EdgeInsets.all(8),
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: Color(0xff21cdc0), width: 2)),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "$type",
          style: TextStyle(
            fontFamily: "Robot",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
