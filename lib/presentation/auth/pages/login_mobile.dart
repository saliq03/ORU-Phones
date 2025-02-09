import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oruphones_assignment/core/configs/assets/app_images.dart';
import 'package:oruphones_assignment/core/configs/colors/app_colors.dart';

import '../../../core/configs/assets/app_vectors.dart';

class LoginMobilePage extends StatelessWidget {
  const LoginMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AppVectors.cross,width: 20,height: 20,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),),
                  ),
                ],),
             SizedBox(width: double.infinity,height: 50,),
              Container(
              width: 170,height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                     fit: BoxFit.cover,
                    image: AssetImage(AppImages.logo))
              ),),
              SizedBox(height: 60,),
              Text("Welcome",style: TextStyle(fontSize: 28,color: AppColors.primary,fontWeight: FontWeight.w600),),
              Text("Sign in to continue",style: TextStyle(color: Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400),),
              SizedBox(height: 100,),
              phoneField()
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Enter Your Phone Number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xff282828)),),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Mobile Number",
            prefixText: "+91",
            prefixStyle: TextStyle(
              color: Color(0xFF757474),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
