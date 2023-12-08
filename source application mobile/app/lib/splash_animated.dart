
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';




class splash_animated extends StatelessWidget {
  const splash_animated({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

        duration: 1000,
        splashIconSize:400,
        splashTransition:SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.leftToRight,

        splash:  CircleAvatar(
          radius: 500,
          backgroundImage: AssetImage("assets/images/as2e.png"),),
        nextScreen:const auth());
  }
}
