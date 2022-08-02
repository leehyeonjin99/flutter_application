import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_state_mangae/src/controller/dependency_controller.dart';

class GetlazyPut extends StatelessWidget {
  const GetlazyPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: (){
          Get.find<DependencyController>().increase();
        },
        child: Text("Increase"),
      ),
    );
  }
}