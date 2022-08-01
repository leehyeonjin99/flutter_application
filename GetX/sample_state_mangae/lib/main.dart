import 'package:flutter/material.dart';
import 'package:sample_state_mangae/src/home.dart';
import 'package:get/get.dart';
import 'package:sample_state_mangae/src/pages/next.dart';
import 'package:sample_state_mangae/src/pages/normal/first.dart';
import 'package:sample_state_mangae/src/pages/normal/second.dart';
import 'package:sample_state_mangae/src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  Home()),
        GetPage(name: '/first', page: () =>  FirstPage()),
        GetPage(name: '/second', page: () =>  SecondPage()),
        GetPage(name: '/next', page:() =>  NextPage()),
        GetPage(name: '/user/:uid', page:() =>  UserPage())
      ]
    );
  }
}