import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                // Navigator.of(context).pop();
                Get.back();
              }, 
              child: Text("뒤로 페이지 이동")
            ),
            ElevatedButton(
              onPressed: (){
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(
                //     builder: (context) => Home(),
                //   ),
                //   (route) => false
                // );
                Get.offAllNamed("/");
              }, 
              child: Text("홈 이동")
            )
          ],
        ),
      ),
    );
  }
}