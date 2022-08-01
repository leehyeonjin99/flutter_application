import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_state_mangae/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  Widget _button(String id){
    return ElevatedButton(
      onPressed: (){
        Get.find<CountControllerWithGetX>().increase(id);
      }, 
      child: Text(
        "+",
        style: TextStyle(
          fontSize: 30
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GetX",
            style: TextStyle(
              fontSize: 30
            ),
          ),
          GetBuilder<CountControllerWithGetX>(
            id: "first",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(
                  fontSize: 50
                ),
              );
            }
          ),
          GetBuilder<CountControllerWithGetX>(
            id: "second",
            builder: (controller){
              return Text(
                "${controller.count}",
                style: TextStyle(
                  fontSize: 50
                ),
              );
            }
          ),
          _button("first"),
          _button("second")
        ],
      ),
    );
  }
}