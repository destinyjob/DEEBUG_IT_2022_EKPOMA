import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_with_getx/controller/userController.dart';

class Second extends StatelessWidget{
  final UserController userController = Get.put(UserController());
  @override
  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Name: ${userController.user.value.name}')),
    );
  }
}