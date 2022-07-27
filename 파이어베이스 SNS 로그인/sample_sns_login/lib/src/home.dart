import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_sns_login/src/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Firebase SNS Login"),
      // ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if (!snapshot.hasData){
            return LoginWidget();
          }
          else{
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${snapshot.data!.displayName}님 환영합니다."
                  ),
                  ElevatedButton(
                    onPressed: FirebaseAuth.instance.signOut, 
                    child: Text("Logout"),
                    style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.3))
                  )
                ],
              ),
            );
          }
        },
      )
    );
  }
}