import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/model/user.dart';
import 'package:video_player/video_player.dart';
import 'package:async/async.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController2 = new TextEditingController();


  var status = false;
  var password = false;
  var textField = false;
  var radioType = 0;





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "KAYIT OL",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Builder(builder: (context){
        return  SingleChildScrollView(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 38),
                child: Text(
                  "E-Mail",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff286f8e),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff286f8e), width: 3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: size.width - 75,
                child: TextField(
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Adınızı Soyadınızı giriniz...",
                    icon: Icon(Icons.email),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff286f8e), width: 3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: size.width - 75,
                child: TextField(
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _phoneController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Telefon numaranızı giriniz...",
                    icon: Icon(Icons.email),
                  ),

                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff286f8e), width: 3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: size.width - 75,
                child: TextField(
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "E-mail adresinizi giriniz...",
                    icon: Icon(Icons.email),
                  ),

                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 38),
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff286f8e),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff286f8e), width: 3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: size.width - 75,
                child: TextField(
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.face),
                    border: InputBorder.none,
                    hintText: "Şifrenizi giriniz...",
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  onTap: () {
                    password = true;
                  },
                  onChanged: (value) {},
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff286f8e), width: 3),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: size.width - 75,
                child: TextField(
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.face),
                    border: InputBorder.none,
                    hintText: "Şifrenizi tekrar giriniz...",
                  ),
                  controller: _passwordController2,
                  obscureText: true,
                  onTap: () {
                    password = true;
                  },
                  onChanged: (value) {},
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width - 120,
                child: Material(
                  elevation: 4,
                  color: Color(0xff286f8e),
                  child: Container(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Radio(
                          value:0,
                          activeColor: Colors.deepOrange,
                          groupValue: radioType,
                          onChanged: (index){
                            radioType = 0;
                            setState(() {

                            });
                          },
                        ),
                        Text("VETERİNER",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Radio(
                          value:1,
                          activeColor: Color(0xff21cdc0),
                          groupValue: radioType,
                          onChanged: (index){
                            radioType = 1;
                            setState(() {

                            });
                          },
                        ),
                        Text("KULLANICI",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontFamily: "Pop",
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: size.width - 120,
                height: 50,
                child: FlatButton(
                  child: Text("Kayıt Ol",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: Color(0xff286f8e),
                  onPressed: () async {
                    User kullanici = new User();
                    kullanici.adsoyad = _usernameController.text;
                    kullanici.posta = _emailController.text;
                    kullanici.number = _phoneController.text;
                    kullanici.sifre = _passwordController.text;
                    kullanici.code = getId();
                    kullanici.tur = radioType.toString();
                    SnackBar sn = new SnackBar(content: new Row(children: <Widget>[new CircularProgressIndicator(), new Text("Kayıt Olunuyor..."),],));
                    Scaffold.of(context).showSnackBar(sn);
                    String sonuc = await sendRegister(kullanici);
                    if(sonuc == "200"){
                      Navigator.pop(context);
                    }else{

                    }
                  },
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
