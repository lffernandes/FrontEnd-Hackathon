import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_reclame_ja/screens/home_screen.dart';
import 'package:flutter_app_reclame_ja/screens/signin_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/colors_utils.dart';

class MySplashSreen extends StatefulWidget {
  const MySplashSreen({Key? key}) : super(key: key);
  @override
  State<MySplashSreen> createState() => _MySplashSreenState();
}

class _MySplashSreenState extends State<MySplashSreen> {
  splashScreenTimer() {
    Timer(const Duration(seconds: 1), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const SignInScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    splashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringtoColor("845EC2"),
              hexStringtoColor("D65DB1"),
              hexStringtoColor("845EC2")
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: logoWidget("assets/images/logo.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
