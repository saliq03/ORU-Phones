
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones_assignment/core/configs/assets/app_animations.dart';
import 'package:oruphones_assignment/data/sources/user_prefrences/user_prefrences.dart';
import 'package:oruphones_assignment/presentation/auth/pages/login_mobile.dart';


import '../../../services/notification/notification_services.dart';
import '../../home/pages/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  NotificationServices notificationServices=NotificationServices();
  List<dynamic> products = [];


  Future<void> fetchProducts() async {


   
      Map<String, dynamic> filters = {
        "filter": {
          "condition": ["Like New", "Fair","Good"],
          // "make": ["Samsung"],
          "storage": ["16 GB", "32 GB"],
          // "ram": ["4 GB"],
          // "warranty": ["Brand Warranty", "Seller Warranty"],
          // "priceRange": [40000, 175000],
          // "verified": true,
          // "sort": {}, // Add sorting logic if needed
          // "page": 1,
        },
      };


  }




  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);

    notificationServices.getDeviceToken().then((value){
      print("device tonken \n");
      print(value);
    });
    fetchProducts();
    Navigate();
  }

  Navigate()async{
    bool isLogin= await UserPreferences().isLogin();
    Future.delayed(Duration(seconds: 3), (){
      if(isLogin){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginMobilePage()),
        );
      }

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
