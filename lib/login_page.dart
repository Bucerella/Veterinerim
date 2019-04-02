import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  VideoPlayerController playerController;
  VideoPlayerController playerController2;
  VoidCallback listener;

  var status = false;
  var password = false;
  var textField = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listener = () {
      print(playerController.value.position);
      Duration duration2 = Duration(seconds: 14);
      Duration duration = Duration(seconds: 0);
      if (password == true) {
        print("SW");

        playerController.seekTo(duration2);
        password = false;

        //  playerController.play();

      }
      else if (playerController.value.position >= Duration(seconds: 9) && playerController.value.position < Duration(seconds: 14)) {
        print("$password ++");
        playerController.seekTo(Duration(seconds: 6) );

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
      //playerController.play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        //playerController.play();
      }
    }
  }

  void createVideo2(path) {
    if (playerController2 == null) {
      playerController2 = VideoPlayerController.asset("images/$path");
      playerController2.addListener(listener);
      playerController2.initialize();
      playerController2.play();
    } else {
      if (playerController2.value.isPlaying) {
        playerController2.pause();
      } else {
        playerController2.initialize();
        playerController2.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "VETERİNERİM",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            Text(
              "E-Mail",
              style: TextStyle(
                fontSize: 23,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _usernameController,
              onChanged: (value) {},
              onTap: () {
                status = true;

                playerController.play();
                textField = true;
              },
              textAlign: TextAlign.start,
            ),
            Text(
              "Password",
              style: TextStyle(
                fontSize: 23,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              onTap: () {
                // playerController.dispose();
                password = true;
              },
              onChanged: (value) {},
              textAlign: TextAlign.start,
            ),
            FlatButton(
              child: Text("Giriş Yap"),
              color: Colors.teal,
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Kaydol"),
              color: Colors.teal,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

