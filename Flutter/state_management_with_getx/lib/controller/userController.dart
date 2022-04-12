import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController{
  final user = User().obs;

  updateUsers(int count, String name){
    user.update((value) {
      value?.name = name;
      value?.count = count;
    });
  }
}