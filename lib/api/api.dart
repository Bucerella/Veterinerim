import 'dart:math';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:veterinerim/model/animals_model.dart';
import 'package:veterinerim/model/user.dart';

Future<String> sendRegister(User users) async{

  String apiUrl = "http://192.168.1.22:8080/rest/veterinary/save";
  var body = jsonEncode({"ad":users.adsoyad,"sifre":users.sifre,"tur":users.tur,"posta":users.posta,"code":users.code,"number":users.number});
  http.Response response = await http.post(Uri.encodeFull(apiUrl),body: body, headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
    return response.statusCode.toString();
}

Future<String> sendAnimals(Animals animals) async{

  String apiUrl = "http://192.168.1.22:8080/rest/animal/add";
  var body = jsonEncode({"name":animals.name,"userId":animals.userId,"gender":animals.gender,"type":animals.type,"weight":animals.weight,"age":animals.age,"allergic":animals.allergic});
  http.Response response = await http.post(Uri.encodeFull(apiUrl),body: body, headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  return response.statusCode.toString();
}

Future<String> editAnimals(Animals animals) async{

  String apiUrl = "http://192.168.1.22:8080/rest/animal/add";
  var body = jsonEncode({"id":animals.id,"name":animals.name,"userId":animals.userId,"gender":animals.gender,"type":animals.type,"weight":animals.weight,"age":animals.age,"allergic":animals.allergic});
  http.Response response = await http.post(Uri.encodeFull(apiUrl),body: body, headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  return response.statusCode.toString();
}

Future<List> getAnimalsList(int id) async{
  String apiUrl = "http://192.168.1.22:8080/rest/animal/getAll?user-id=$id";
  http.Response response = await http.get(Uri.encodeFull(apiUrl),headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  return json.decode(response.body);
}


Future<String> sendLogin(User users) async{
  String apiUrl = "http://192.168.1.22:8080/rest/veterinary/login";
  var body = jsonEncode({"posta":users.posta, "sifre":users.sifre});
  http.Response response = await http.post(Uri.encodeFull(apiUrl),body: body, headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });

  return response.body;
}

Future<Map> getUserInfo(int id) async{
  String apiUrl = "http://192.168.1.22:8080/rest/veterinary/get-info?test=$id";
  http.Response response = await http.get(Uri.encodeFull(apiUrl),headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  return json.decode(response.body);
}


Future<List> fetchCoupling(int id) async{
  String apiUrl = "http://192.168.1.22:8080/rest/veterinary/fetch-coupling?id=$id";
  http.Response response = await http.get(Uri.encodeFull(apiUrl),headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  return json.decode(response.body);
}




Future<String> addUserCode(String id, String usercode) async{
  String apiUrl = "http://192.168.1.22:8080/rest/veterinary/coupling-add?vet-id=$id&user-code=$usercode";
  http.Response response = await http.get(Uri.encodeFull(apiUrl),headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  return response.body;
}


String getId(){
  var rnd = new Random();
  List<int> list = new List() ;
  for(int i = 0 ; i <6;i++){
    if(i%2==0)
      list.insert(i,48+rnd.nextInt(9));
    else
      list.insert(i,65+rnd.nextInt(25));
  }
  int number = 100000 + rnd.nextInt(100000);

  return new String.fromCharCodes(list);


}