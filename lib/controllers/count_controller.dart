import 'package:get/get.dart';

class CountController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter.value++;
    update();
  }
}
