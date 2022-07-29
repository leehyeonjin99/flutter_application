import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_route_manage/src/pages/named/second.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Get.parameters["uid"]}"),
            Text("${Get.parameters["name"]}님 안녕하세요"),
            Text("${Get.parameters["age"]}세가 맞으신가요?"),
            ElevatedButton(
              onPressed: (){
                Get.back();
              }, 
              child: Text("뒤로 이동")
            )
          ],
        ),
      ),
    );
  }
}