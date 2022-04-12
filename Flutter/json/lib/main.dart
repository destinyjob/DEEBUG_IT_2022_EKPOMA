import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:json_parse/users.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json',
      theme: ThemeData(primarySwatch: Colors.red),
      home: JsonHome(),
    );
  }
}



class JsonHome extends StatefulWidget {
  @override
  _JsonHomeState createState() => _JsonHomeState();
}

class _JsonHomeState extends State<JsonHome> {

  Future fetchUser() async{
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(url));

    List<User> users = [];

    if(response.statusCode == 200){
      //decode json body into map
      var usersJson = json.decode(response.body);

      for(var userJson in usersJson){
        users.add(User.fromJson(userJson));
      }
    }

    return users;
  }
  List<User> usersVisual = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser().then((users) => {
      usersVisual.addAll(users),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: usersVisual.length,
          itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(usersVisual[index].name.toString()),
                    SizedBox(height: 4),
                    Text(usersVisual[index].username.toString()),
                    SizedBox(height: 4),
                    Text(usersVisual[index].email.toString())
                  ],
                ),
              ),
            );
          })
    );
  }
}



