import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/model/user.dart';
import 'package:veterinerim/veterinarypage/users_animals.dart';

class VetAnimals extends StatefulWidget {
  final List couplingList;
  final int id;

  VetAnimals(this.couplingList, this.id);

  @override
  _VetAnimalsState createState() => _VetAnimalsState();
}

class _VetAnimalsState extends State<VetAnimals> {
  Widget appBarTitle = new Text(
    "Üyelerimiz",
    style: new TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: "Pop",
    ),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  _VetAnimalsState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = List();
    for (int i = 0; i < widget.couplingList.length; i++) {
      _list.add("${widget.couplingList[i]["ad"]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: _list.length == 0
          ? Text("Herhangi bir üyeniz yok.Hemen bir üye ekle.")
          : new ListView(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              children: _IsSearching ? _buildSearchList() : _buildList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            Map sonuc =  await  showDialog(context: context, builder: (context){
              return ShowAlert(widget.id);
            });
            Map user =  Map();
            var sonuc2 = sonuc['user'].toString().split("-");
            user['id'] = int.parse(sonuc2[0]);
            user['adsoyad'] = sonuc2[1];
            widget.couplingList.add(user);
            _list.add("${sonuc2[1]}");
            setState(() {

            });


            print(widget.couplingList);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact,widget.couplingList)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact,widget.couplingList)).toList();
    } else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact,widget.couplingList)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: Color(0xff21cdc0),
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = new TextField(
                    controller: _searchQuery,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Pop",
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Arama...",
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "ÜYELERİMİZ",
        style: new TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }

}

class ChildItem extends StatelessWidget {
  final String name;
  final List list;


  ChildItem(this.name, this.list);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
       print(list);
       int id = getIdFromList(list, name);

       List userAnimals = await getAnimalsList(id);
       var route = MaterialPageRoute(builder: (context) => UserAnimals(userAnimals));
       Navigator.push(context, route);

      },
      child: Card(
        child: new ListTile(
          title: new Text(
            this.name,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Pop",
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text("Kiki,Koko,Kükü"),
          leading: Icon(Icons.people),
        ),
      ),
    );
  }
}
getIdFromList(List list,String name){

  for(int i = 0 ; i <list.length;i++){
    if(list[i]["ad"]=="$name"){
      return list[i]["id"];
    }
  }

}
class ShowAlert extends StatefulWidget {
  final int id;

  ShowAlert(this.id);

  @override
  _ShowAlertState createState() => _ShowAlertState();
}

class _ShowAlertState extends State<ShowAlert> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("KULLANICI KODU GİR"),
      elevation: 4,
      backgroundColor: Colors.deepOrange,
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: "Kullanıcı kodunu giriniz...",
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("EKLE"),
          color: Colors.red,
          onPressed: () async {
            String coupling = await addUserCode("${widget.id}", _textEditingController.text);
            if(coupling == "-1"){
              print("hata");
            }else{
              Navigator.pop(context,{"user":"${coupling}"});
            }
          },
        ),
      ],
    );
  }
}
