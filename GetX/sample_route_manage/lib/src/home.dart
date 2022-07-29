import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_route_manage/src/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("라우트 관리 홈")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => FirstPage()
                //   )
                // );
                Get.to(() => FirstPage());
              }, 
              child: Text("일반적인 라우트"),
              style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.3))
            ),
            ElevatedButton(
              onPressed: (){
                // Navigator.of(context).pushNamed("/first");
                Get.toNamed("/first");
              }, 
              child: Text("Named 라우트"),
              style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.3))
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed("/next", arguments: User("현진", 24));
              }, 
              child: Text("Argument 전달"),
              style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.3))
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed("/user/991222?name=현진&age=24");
              }, 
              child: Text("동적 url 전달"),
              style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.3))
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