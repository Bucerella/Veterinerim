import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/userpage/animals_add.dart';
import 'package:veterinerim/userpage/animals_detail_edit.dart';

class Animals extends StatefulWidget {
  final int id;
  final List animalList;

  Animals(this.id, this.animalList);
  @override
  _AnimalsState createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  var animalList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalList = widget.animalList;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(animalList);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "HAYVANLARIM",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Pop",
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Color(0xff21cdc0),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: animalList.length,
            itemBuilder: (context, i) {
              int iconId = animalList[i]["type"];
              String icon = getPathFromId(iconId);
              var title = animalList[i]["name"];
              var subtitle = animalList[i]["allergic"];
              return animalsCard(size, icon, title, subtitle, context,animalList[i]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff21cdc0),
          child: Icon(Icons.add),
          onPressed: () async {
          var route = MaterialPageRoute<Map>(builder: (context) => AnimalsAdd(widget.id));
          Map aniAdd = await Navigator.push(context, route);
          if(aniAdd.containsKey("status")){
            animalList = await getAnimalsList(widget.id);
            setState(() {

            });
          }
          }),
    );
  }

  Widget animalsCard(Size size, icon, title, subtitle, context,animalList) {
    return InkWell(
      onTap: () async {

        var route = MaterialPageRoute<Map>(builder: (context) => AnimalsEdit(animalList));
        Map aniAdd = await Navigator.push(context, route);
        if(aniAdd.containsKey("status")){
          print("WWW");
          this.animalList = await getAnimalsList(widget.id);
          print(animalList);
          setState(() {

          });
        }

      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width - 30,
            child: ListTile(
              leading: Image.asset(
                "$icon",
                scale: 2,
              ),
              title: Text(
                "$title",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: "Pop",
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "$subtitle",
                style: TextStyle(
                  fontFamily: "Pop",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        elevation: 3,
      ),
    );
  }
}

String getPathFromId(int id) {
  if (id == 0) {
    return "images/cat_icon.png";
  } else if (id == 1) {
    return "images/bird_icon.png";
  } else if (id == 2) {
    return "images/dog_icon.png";
  } else if (id == 3) {
    return "images/turtle_icon.png";
  } else {
    return "images/hamster_icon.png";
  }
}

