
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones_assignment/core/configs/assets/app_animations.dart';
import 'package:oruphones_assignment/presentation/auth/pages/login_mobile.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginMobilePage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Lottie.asset(
          AppAnimations.splash,
          width: 400,
          // height: 154,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
