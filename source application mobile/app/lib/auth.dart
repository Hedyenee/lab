
import 'package:app/home.dart';
import 'package:app/sigin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class auth extends StatelessWidget {
  static const screenRoute='/page9';
  const auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: ((context,snapshot){
          if (snapshot.hasData){
            return login();
          }else{
            return login();
          }
        }
        ),
      ),
    );
  }
}