import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = '';
  var clockTime = List<String>();
  CalendarCarousel _calendarCarouselNoHeader;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int index = 9;
    for (int i = 0; i < 19; i++) {
      if (i % 2 == 0) {
        clockTime.add("${index}:00");
      } else {
        clockTime.add("${index}:30");
        index++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        print(_currentDate2);
      },
      selectedDayButtonColor: Color(0xff21cdc0),
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      weekdayTextStyle: TextStyle(color: Colors.white),
      weekDayFormat: WeekdayFormat.standaloneShort,
      height: 300.0,
      selectedDateTime: _currentDate2,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal: false,
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate,
      maxSelectedDate: _currentDate.add(Duration(days: 60)),
      onCalendarChanged: (DateTime date) {
        this.setState(
            () => _currentMonth = DateFormat.yMMM("tr_TR").format(date));
      },
    );

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Color(0xff21cdc0),
          title: new Text(
            "RANDEVU AL",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Pop",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Randevu almak istediğiniz tarihi seçiniz.",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Pop",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff21cdc0),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  top: 8.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                    FlatButton(
                      child: Text(
                        'Önceki',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Pop",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentDate2 =
                              _currentDate2.subtract(Duration(days: 30));
                          _currentMonth =
                              DateFormat.yMMM("tr_TR").format(_currentDate2);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Sonraki',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Pop",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentDate2 = _currentDate2.add(Duration(days: 30));
                          _currentMonth =
                              DateFormat.yMMM("tr_TR").format(_currentDate2);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Pzr',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Pzt',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Sal',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Çrş',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Prş',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Cma',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Cmt',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 16,
                  children: clockTime.map((item) {
                    return FilterChip(
                        backgroundColor: Color(0xff21cdc0),
                        label: Text(
                          "$item",
                          style: TextStyle(color: Colors.white),
                        ),
                        onSelected: (val) {
                          print(clockTime.indexOf("$item"));
                          registerAppointmentAlert(context,_currentDate2.toString().substring(0,10),item);
                        });
                  }).toList(),
                ),
              )
            ],
          ),
        ));
  }

  void registerAppointmentAlert(
      BuildContext context, String date, String time) {
    var alert = AlertDialog(
      title: Text("Randevuyu Onayla"),
      content: Text("$date  / $time tarihli randevuyu onaylıyor musunuz? "),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.check),
              Text("Evet"),
            ],
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.close),
              Text("İptal"),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context,builder: (context)=>alert);
  }
}
