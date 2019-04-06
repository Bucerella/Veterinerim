import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
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
      body: SingleChildScrollView(
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
                onChanged: (value) {},
                onTap: () {
                  status = true;

                  playerController.play();
                  textField = true;
                },
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
                onChanged: (value) {},
                onTap: () {
                  status = true;

                  playerController.play();
                  textField = true;
                },
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
                child: Text("Kayıt Ol",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                color: Color(0xff286f8e),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
