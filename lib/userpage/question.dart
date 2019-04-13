import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/model/question.dart';

class QuestionPage extends StatefulWidget {

 final List askQuestion;
 final int id;


 QuestionPage(this.askQuestion, this.id);

 @override
  _QuestionPageState createState() => _QuestionPageState();
}


class _QuestionPageState extends State<QuestionPage> {

  List askQuestion;


  TextEditingController questionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askQuestion = widget.askQuestion;
  }

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
        body: ListView.builder(itemCount: askQuestion.length,itemBuilder: (context,i){

         return questionCard(
              size,
              askQuestion[i]["question"],askQuestion[i]["answer"]);



        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff21cdc0),
            child: Icon(Icons.add,),

            onPressed: () async{

              Question result = await showDialog(context: context, builder: (context) => AddQuestion(widget.id));
              if(result!=null){
                Map newQuestion = Map();
                newQuestion["question"] =result.question;
                askQuestion.add(newQuestion);
                setState(() {
                });
              }


            })
    );
  }





}
class AddQuestion extends StatelessWidget {

  TextEditingController questionController = TextEditingController();
  final int id;


  AddQuestion(this.id);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Sorunuzu Giriniz"),
      content: TextField(
        controller: questionController,
        maxLines: 3,
        decoration: InputDecoration(
            hintText: "Sorunuz.."
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () async{
            Question postQues = Question();
            postQues.userId = id;
            postQues.question = questionController.text;

            await addQuestion(postQues);

            Question question = Question();
            question.question = questionController.text;

             Navigator.pop(context,question);
             },
          color: Colors.red,
          child: Text("Ekle"),
        ),
      ],
    );
  }
}

Widget questionCard(Size size, question, String answer) {

  var finalAnswer = "Sorunuz henüz cevaplanmadı";
  if(answer !=null){
    if(answer.isNotEmpty){
      finalAnswer = answer;
    }
  }
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
                  child:   Text(
                    "$finalAnswer",
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
