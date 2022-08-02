import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_state_mangae/src/controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetX> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CountControllerWithGetX>(
            id: "binding",
            builder: ((controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(
                  fontSize: 30
                ),
              );
            })
          ),
          ElevatedButton(
            onPressed: (){
              // Get.find<CountControllerWithGetX>().increase("binding");
              // CountControllerWithGetX.to.increase("binding");
              controller.increase("binding");
            }, 
            child: Text("increase")
          )
        ],
      ),
    );
  }
}