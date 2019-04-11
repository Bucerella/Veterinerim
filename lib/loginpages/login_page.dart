import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/loginpages/sign_up.dart';
import 'package:veterinerim/model/user.dart';
import 'package:veterinerim/userpage/home.dart';
import 'package:veterinerim/veterinarypage/vet_home.dart';
import 'package:video_player/video_player.dart';
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  VideoPlayerController playerController;
  VoidCallback listener;

  var status = false;
  var password = false;
  var textField = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listener = () {
      Duration duration2 = Duration(seconds: 14);
      Duration duration = Duration(seconds: 0);
      if (password == true) {
        playerController.seekTo(duration2);
        password = false;
      } else if (playerController.value.position >= Duration(seconds: 9) &&
          playerController.value.position < Duration(seconds: 14)) {
        playerController.seekTo(Duration(seconds: 6));
      }
      if (playerController.value.position > Duration(seconds: 16)) {
        playerController.seekTo(Duration(seconds: 15));
      }
      if (textField == true) {
        playerController.seekTo(duration);
        textField = false;
      }
      setState(() {});
    };
    createVideo("yeti.mov");
  }

  void createVideo(path) {
    if (playerController == null) {
      playerController = VideoPlayerController.asset("images/$path");
      playerController.addListener(listener);
      playerController.initialize();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              status == true
                  ? Container(
                      width: 150,
                      height: 150,
                      child: (playerController != null
                          ? VideoPlayer(
                              playerController,
                            )
                          : Container()),
                    )
                  : Image.asset(
                      "images/yetiphoto.png",
                      width: 150,
                      height: 150,
                    ),
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
              SizedBox(
                height: 10,
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "E-mail adresinizi giriniz...",
                    icon: Icon(Icons.email),
                  ),
                  onChanged: (value) {},
                  onTap: () {
                    status = true;

                    playerController.play();
                    textField = true;
                  },
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
              SizedBox(
                height: 10,
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
                    hintText: "Şifrenizi adresinizi giriniz...",
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
                width: size.width - 120,
                height: 50,
                child: FlatButton(
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: Color(0xff286f8e),
                  onPressed: () async {
                    User user = User();
                    user.posta = _usernameController.text;
                    user.sifre = _passwordController.text;
                    var text = "Giriş olunuyor";
                    SnackBar sn = new SnackBar(
                        content: new Row(
                      children: <Widget>[
                        new CircularProgressIndicator(),
                        new Text(text),
                      ],
                    ));
                    Scaffold.of(context).showSnackBar(sn);
                    String sonuc = await sendLogin(user);
                    if (sonuc == "-1") {
                      print("Kayıtlı Değil/Hatalı E-posta");
                    } else if (sonuc == "0") {
                      print("Şifreniz hatalı");
                      SnackBar sn = new SnackBar(
                          content: new Row(
                        children: <Widget>[
                          new CircularProgressIndicator(),
                          new Text("Hatlaı şifre"),
                        ],
                      ));
                      Scaffold.of(context).showSnackBar(sn);
                    } else {
                      var sonuc2 = sonuc.split("-");
                      int id = int.parse(sonuc2[1]);
                      saveData(id);
                      if (sonuc2[0] == "1") {
                        var list = await getUserInfo(id);
                        var route = MaterialPageRoute(
                            builder: (context) => UserPage(id, list));
                        Navigator.push(context, route);
                      } else {
                        var list = await getUserInfo(id);
                        var route = MaterialPageRoute(
                            builder: (context) => VetHome(id, list));
                        Navigator.push(context, route);
                      }
                    }
                  },
                ),
              ),
              FlatButton(
                child: Text(
                  "Kayıt Ol",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  var route = MaterialPageRoute(builder: (context) => SignUp());
                  Navigator.push(context, route);
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController.dispose();
  }

  saveData(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("id", id);
    print(id);
  }
}
