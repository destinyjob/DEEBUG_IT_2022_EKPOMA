import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_with_getx/controller/countController.dart';
import 'package:state_management_with_getx/controller/userController.dart';
import 'package:state_management_with_getx/second.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  final CounterController countController = Get.put(CounterController());
  final UserController userController = Get.put(UserController());
  @override
  build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(),

        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterController>(builder: (fav){
                return Text('Current Count Value: ${fav.count}');
              }),

              SizedBox(height: 50),
              MaterialButton(
                onPressed: (){
                  userController.updateUsers(3, 'Oscar');
                },
                child: Text('Update Name & Stored Count'),
                color: Colors.grey,
              ),
              SizedBox(height: 50),

              Obx((){
                return Column(
                  children: [
                    Text('Stored Count: ${userController.user.value.count}'),
                    Text('Name: ${userController.user.value.name}'),
                  ],
                );
              }),
              MaterialButton(
                onPressed: (){
                  Get.to(() => Second());
                },
                child: Text('Next Screen'),
                color: Colors.blue,
              )
            ],
          ),
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: (){
            countController.increment();
          },
        ),
      ),
    );
  }
}


// class Second extends StatelessWidget{
//   @override
//   build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }