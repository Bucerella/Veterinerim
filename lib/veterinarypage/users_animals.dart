import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/veterinarypage/useranimals_detail.dart';

class UserAnimals extends StatefulWidget {

final List getAnimals;

UserAnimals(this.getAnimals);

@override
  _UserAnimalsState createState() => _UserAnimalsState();
}


class _UserAnimalsState extends State<UserAnimals> {
  var animalList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalList = widget.getAnimals;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Kişinin Hayvanları",
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

    );
  }
}

Widget animalsCard(Size size, icon, title, subtitle, context,animalList) {
  return InkWell(
    onTap: () async {

      List vaccineList = await allVaccine(animalList["id"]);
      print(animalList["id"]);
      var route = MaterialPageRoute<Map>(builder: (context) => UserAnimalDetail(animalList,vaccineList));
      Navigator.push(context, route);



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
