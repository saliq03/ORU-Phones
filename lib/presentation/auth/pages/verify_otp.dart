import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/buttons/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../widgets/app_bar.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarAuth(),
                SizedBox(width: double.infinity,height: 60,),
                Container(
                  width: 170,height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.logo))
                  ),),
                SizedBox(height: 50,),
                Text("Verify Mobile No.",style: TextStyle(fontSize: 28,color: AppColors.primary,fontWeight: FontWeight.w600),),
                Text("Please enter the 4 digital verification code sent to your mobile  number +91-7587329682 via SMS",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400),),
                SizedBox(height: 100,),
                // phoneField(),
                SizedBox(height: 100,),
                // termsAndConditionsWidget(),
                SizedBox(height: 5,),
                BasicAppButton(title: "Verify OTP", onPress: (){

                })
              ],
            ),
          ),
        ),
      ),
    );
  }

}
