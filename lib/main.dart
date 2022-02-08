import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/colors.dart';
import 'package:login_reg/homeScreen/home_screen.dart';
import 'package:login_reg/widgets.dart';

import 'login/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedSplashScreen(
          splash: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  firstColor,
                  secondColor,
                ],
              )),
              child: Center(child: logo())),
          backgroundColor: Colors.white,
          splashIconSize: double.infinity,
          duration: 500,
          nextScreen: const Login()),
    );
  }
}
