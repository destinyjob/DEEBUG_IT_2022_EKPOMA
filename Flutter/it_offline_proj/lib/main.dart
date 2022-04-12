import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyDataBase(),
    );
  }
}


class MyDataBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () async{
             int id = await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName : 'Anointine',
              });
             print(id);
            }, child: Text('Insert')),

            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.queryAll().then((value){
                print(value);
              });

            }, child: Text('Query')),

            ElevatedButton(onPressed: ()async{
              await DatabaseHelper.instance.update({
                DatabaseHelper.columnId : 1,
                DatabaseHelper.columnName : 'Kelvin',
              });
            }, child: Text('Update')),


            ElevatedButton(onPressed: ()async{
              await DatabaseHelper.instance.delete(3);
            }, child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}

