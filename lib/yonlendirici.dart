import 'package:flutter/material.dart';
import 'package:veterinerim/loginpages/login_page.dart';
import 'package:veterinerim/loginpages/sign_up.dart';
import 'package:veterinerim/userpage/home.dart';
import 'package:veterinerim/veterinarypage/vet_home.dart';
class Yonlendirici extends StatefulWidget {
  @override
  _YonlendiriciState createState() => _YonlendiriciState();
}

class _YonlendiriciState extends State<Yonlendirici> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          FlatButton(
color: Colors.red,
              onPressed: (){
            var route = MaterialPageRoute(builder: (context) => VetHome());
            Navigator.push(context, route);
          }),
          FlatButton(
            color: Colors.orange,


              onPressed: (){
            var route = MaterialPageRoute(builder: (context) => UserPage());
            Navigator.push(context, route);
          }),

          FlatButton(
              color: Colors.orange,


              onPressed: (){
                var route = MaterialPageRoute(builder: (context) => SignUp());
                Navigator.push(context, route);
              }),

          FlatButton(
              color: Colors.orange,


              onPressed: (){
                var route = MaterialPageRoute(builder: (context) => LoginPage());
                Navigator.push(context, route);
              }),

        ],
      ),
    );
  }
}
