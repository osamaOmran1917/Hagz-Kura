import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('            Scorpion 🦂'),
        ],
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/shoot.png',
            width: width * .5,
            height: width * .5,
          ),
          SizedBox(
            width: width,
            height: height * .03,
          ),
          TypewriterAnimatedTextKit(
            text: ['حجز كورة'],
            textStyle: TextStyle(
              fontFamily: 'MyArabicFont',
              fontSize: width * .099,
            ),
            speed: Duration(milliseconds: 150),
            totalRepeatCount: 1,
          ),
        ],
      ),
    );
  }
}
