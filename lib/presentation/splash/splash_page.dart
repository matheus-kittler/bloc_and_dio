import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/pokemon-list'),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/img/splash_bg.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/img/pokemon_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            // Lottie.asset(
            //   'assets/lottie/pokeball-loading-animation.json',
            //   width: 45.r,
            //   height: 45.r,
            // ),
          ],
        ),
      ),
    );
  }
}
