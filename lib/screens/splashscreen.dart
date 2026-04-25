import 'package:flutter/material.dart';
import 'package:shopsy/main.dart';
import 'dart:async';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

 @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottom()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
   
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF543CEA),
      body: Center(child: Image.asset("assets/shopsy_logo.jpg",height: height *0.3,),),
    );
  }
}