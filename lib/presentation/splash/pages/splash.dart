
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones_assignment/core/configs/assets/app_animations.dart';
import 'package:oruphones_assignment/presentation/auth/pages/login_mobile.dart';


import '../../../data/sources/api_services.dart';
import '../../home/pages/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<dynamic> products = [];
  List<dynamic> banners = [];

  Future<void> fetchProducts() async {


    try {
      // Prepare filters
      Map<String, dynamic> filters = {
        "filter": {
          "condition": ["Like New", "Fair"],
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

      // Call the API
      final response = await ApiService.fetchProducts(filters);
      print("response status code  ${response.statusCode}");

      if (response.statusCode == 200) {
        print("data");
        print(response.body);
        // Parse the response
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          products = data['products'];
          // Adjust based on your API response
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    } finally {

    }
  }




  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
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
