import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenHome())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Text('BMI Calculator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 4),),
              Lottie.asset(
                'assets/91992-walking-body.json',
              ),
            ],
          )),
    );
  }
}
