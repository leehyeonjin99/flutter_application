import 'package:get/get.dart';

class AppController extends GetxService{
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void ChnagePageIndex(int index){
    currentIndex(index);
  }
}