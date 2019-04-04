import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "VETERİNERE SOR",
            style: TextStyle(
              fontSize: 22,
              color:  Colors.white,
              fontFamily: "Robot",
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xff21cdc0),
        ),
        body: ListView(
          children: <Widget>[
            questionCard(
                size,
                "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı ",
                "bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır."),

          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff21cdc0),
            child: Icon(Icons.add,),
            
            onPressed: (){ showAlert(context, "Selam");})
    );
  }

  void showAlert(BuildContext context,questionAdd){
    var alert = new AlertDialog(
      title: Text("Sorunuzu Giriniz"),
      content: TextField(
        maxLines: 3,
        decoration: InputDecoration(
          hintText: "Sorunuz.."
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Ekle"),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }



}

Widget questionCard(Size size, question, answer) {
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
                    "$question",
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
                    "$answer",
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
