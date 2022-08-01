import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_state_mangae/src/pages/normal/second.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/second');
              }, 
              child: Text("다음 페이지 이동")
            )
          ],
        ),
      ),
    );
  }
}