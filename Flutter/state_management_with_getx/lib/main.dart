import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: AppBar(),

        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: (){},
                child: Text('Update Name & Stored Count'),
                color: Colors.grey,
              ),


              SizedBox(height: 100),


              MaterialButton(
                onPressed: (){
                  Get.to(() => Second());
                },
                child: Text('Next Screen'),
                color: Colors.grey,
              )
            ],
          ),
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: (){},
        ),
      ),
    );
  }
}


class Second extends StatelessWidget{
  @override
  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
    );
  }
}