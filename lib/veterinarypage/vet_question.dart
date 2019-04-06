import 'package:flutter/material.dart';

class VetQuestion extends StatefulWidget {
  @override
  _VetQuestionState createState() => _VetQuestionState();
}

class _VetQuestionState extends State<VetQuestion> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "VETERİNERE SOR",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
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
              "Cevap gir",
              context),
          questionCardStateFull(size,"Deneme","Cevap gir"),
        ],
      ),
    );
  }
}



class questionCardStateFull extends StatefulWidget {
  var size;
  var question;
  var answer;

  questionCardStateFull(this.size, this.question, this.answer);

  @override
  _questionCardStateFullState createState() => _questionCardStateFullState();
}

class _questionCardStateFullState extends State<questionCardStateFull> {

  var answerState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    answerState = widget.answer;
  }
  @override
  Widget build(BuildContext context) {
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
                  width: widget.size.width - 50,
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
                      "${widget.question}",
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
                child: InkWell(
                  onTap: () async{
                    Map result = await showDialog(context: context,builder: (BuildContext context){
                      return AddAnswer(answerCurrent: answerState,);
                    });

                    if(result.containsKey('answer'))
                    answerState = result['answer'];


                    setState(() {

                    });
                    print(result);

                  },
                  child: Container(
                    width: widget.size.width - 50,
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
                        "${answerState}",
                        style: TextStyle(
                            fontFamily: "Pop", fontSize: 16, color: Colors.black),
                      ),
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
}


Widget questionCard(Size size, question, answer, context) {
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
              child: InkWell(
                onTap: () async{
                 Map result = await showDialog(context: context,builder: (BuildContext context){
                   return AddAnswer();
                 });
                 print("$result");
                },
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
class AddAnswer extends StatelessWidget {
  final String answerCurrent;


  const AddAnswer({Key key, this.answerCurrent}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var answerText = TextEditingController();
    answerText .text = "$answerCurrent";
    return AlertDialog(
      title: Text("Sorunuzu Giriniz"),
      content: TextField(
        controller: answerText,
        maxLines: 3,
        decoration: InputDecoration(hintText: "Sorunuz.."),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: InkWell(
            onTap: (){
              Navigator.pop(context,{'answer':'${answerText.text}'});

            },
            child: Text("Ekle"),

          ),
        ),
      ],
    );
  }
}
