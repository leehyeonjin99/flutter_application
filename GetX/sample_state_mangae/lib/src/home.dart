import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_state_mangae/src/pages/named/first.dart';
import 'package:sample_state_mangae/src/pages/reacted_state_manage_page.dart';
import 'package:sample_state_mangae/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("라우트 관리 홈"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Get.to(() => FirstPage());
              }, 
              child: Text("일반적인 라우트")
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/first');
              }, 
              child: Text("Named 라우트")
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/next', arguments: User("현진", 24));
              }, 
              child: Text("Argument 전달")
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/user/991222?name=현진&age=24');
              }, 
              child: Text("동적 url 전달")
            ),
            ElevatedButton(
              onPressed: (){
                Get.to(SimpleStateManagePage());
              }, 
              child: Text("단순 상태 관리")
            ),
            ElevatedButton(
              onPressed: (){
                Get.to(ReactedStateManagePage());
              }, 
              child: Text("반응형 상태 관리")
            )
          ],
        ),
      ),
    );
  }
}

class User{
  String? name;
  int? age;
  User(this.name, this.age);
}