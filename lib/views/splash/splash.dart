import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/util/router.dart';
import 'package:flutter_ebook_app/views/main_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //عاوز الغي الستيتفول ويدجيت واستخدم البروفايدر بس مش عارف هنفذ الفنكشن ازاي(فنكشن startTimer)
  startTimeout() {
    return new Timer(Duration(seconds: 2), changeScreen); //TODO:trayer 3
    //TODO:why he dont use change screen directory instead of handleTimeOut
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    MyRouter.pushPageReplacement(
      context,
      MainScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

//TODO:trayer 1
  @override
  void dispose() {
    super.dispose();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //TODO:trayer 2..delete column widgets
        child: Image.asset(
          "assets/images/app-icon.png",
          height: 300.0,
          width: 300.0,
        ),
      ),
    );
  }
}

/* child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Image.asset(
      "assets/images/app-icon.png",
      height: 300.0,
      width: 300.0,
    ),
  ],
), */
