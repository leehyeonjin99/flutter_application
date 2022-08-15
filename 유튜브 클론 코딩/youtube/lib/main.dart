import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/binding/init_binding.dart';
import 'src/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube Clone App",
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: () => App())
      ],
    );
  }
}