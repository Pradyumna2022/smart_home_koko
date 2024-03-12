import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modern_smart_home/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int countTimer = 5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startCountTimer();
  }

  void startCountTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countTimer > 0) {
          countTimer--;
        } else {
          timer.cancel();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPLASH TIMER',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Text(
              countTimer.toString(),
              style: TextStyle(color: Colors.white, fontSize: 100),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'lib/icons/smart-home.png',
                scale: 4,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Text(
                "Smart Home",
                style: TextStyle(color: Colors.white, fontSize: 42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
