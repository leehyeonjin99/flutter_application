import 'package:get/get.dart';
import 'package:sample_state_mangae/src/controller/count_controller_with_getx.dart';

class BindingPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CountControllerWithGetX());
  }
}