import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;

  get updateUser => null;

  void increment() {
    count++;
    update();
  }
}
