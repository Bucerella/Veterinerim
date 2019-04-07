import 'package:flutter/material.dart';
import 'package:veterinerim/api/api.dart';
import 'package:veterinerim/model/user.dart';

Widget registerBuilder(User users){

  return FutureBuilder(future: sendRegister(users),builder: (context, AsyncSnapshot snapshot){

    if(snapshot.hasData){
      return Text( "Başarılı");
    }else{
      return CircularProgressIndicator();
    }


  });

}