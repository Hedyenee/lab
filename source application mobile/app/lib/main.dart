
import 'package:app/home.dart';
import 'package:app/sigin.dart';
import 'package:app/signup.dart';
import 'package:app/splash_animated.dart';
import 'package:flutter/material.dart';
import 'package:app/all.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const splash_animated(),
        auth.screenRoute :(context) => const auth(),
        login.screenRoute :(context) => const login(),
        all.screenRoute :(context) => const all(),
        signup.screenRoute : (context) => const signup(),
        home.screenRoute : (context) =>  home(),

        //auth.screenRoute:(context) => auth(),
        //signup.screenRoute:(context) => signup(),
      },
    );
        }
}
