import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';


class CalendarViewApp extends StatelessWidget {
  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.amber,
      ),

      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('Flutter Calendar'),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(

            vertical: 10.0,
          ),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Calendar(
                onSelectedRangeChange: (range) =>
                    print("Range is ${range.item1}, ${range.item2}"),
                onDateSelected: (date) => handleNewDate(date),
              ),
              SizedBox(height: 10,),
              createTimeLine(size,"09:00","Buse ERKUŞ"),
              createTimeLine(size,"13:00","Mehmet Ak"),
              createTimeLine(size,"19:30","Yağmur Yağmurov"),

            ],
          ),
        ),
      ),
    );
  }
  Widget createTimeLine(size,time,user){
    return  Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 3,
          color: Colors.amber,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width-3,
              height: 3,
              color: Color(0xFFFAFAFB),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: size.width-5,
              height: 96,
              color: Color(0xFFFFFDFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("$time",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.redAccent,fontSize: 18),),
                  Text("$user",style: TextStyle(color: Colors.amber,fontSize: 18),),
                  Text("Randevu",style: TextStyle(color: Colors.pink),),

                ],
              ),
            ),
            Container(
              width: size.width-5,
              height: 3,
              color: Color(0xFFFAFAFB),
            ),
          ],
        )
      ],
    );
  }
}