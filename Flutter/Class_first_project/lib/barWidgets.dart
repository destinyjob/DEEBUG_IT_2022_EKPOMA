import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';


class barWidgets extends StatefulWidget{
  @override
  State<barWidgets> createState() => _barWidgetsState();
}

class _barWidgetsState extends State<barWidgets> {
  bool initialVal  = true;
  String name = '';
  @override
  build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        elevation: 30,
        child: Column(
          children: [
            SizedBox(height: 70),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Ighalo', style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Ighalo', style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Ighalo', style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Ighalo', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        shape: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: Colors.white,
            width: 5.0
          ),
        ),
        title: Text('Appbar'),
      ),

      ///The body is what basically take up the space between the app bar and the bottom nav bar if the bottom nav bar is present,
      ///if the bottom navbar is not present, the body takes up the entirety of the space beneath the appBar
      body: Container(
        child: Column(
          children: [
            Checkbox(
                value: initialVal,
                onChanged: (val){
                  setState(() {
                    initialVal = val!;
                  });
                },
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network('https://jw-webmagazine.com/wp-content/uploads/2020/03/Kimetsu-no-YaibaDemon-Slayer.jpg'),
            ),

            SizedBox(height: 50),

            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (value){
                  name = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'name',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'password',
                ),
              ),
            ),

            SizedBox(height: 20),

          ],
        ),
      ),

      ///The bottomNavigationBar is a widget that sits at the bottom of the screens
      ///It's used for navigating beteween different screens basically
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: 'Home Page', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.people)),
          BottomNavigationBarItem(label: 'buy&sell', icon: Icon(Icons.sell)),
        ],
      ),

      ///Buttons in flutter allow us carry out specific actions and the floatingActionsButton is just one of the numerous buttons we have
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.arrow_right, size: 40),
        onPressed: (){
          print(name);
        },
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
  }
}