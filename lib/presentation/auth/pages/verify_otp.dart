import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oruphones_assignment/presentation/auth/pages/name.dart';
import 'package:pinput/pinput.dart';

import '../../../common/buttons/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
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
                SvgPicture.asset(AppVectors.logo,width: 116,height: 61,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),),

                SizedBox(height: 50,),
                Text("Verify Mobile No.",style: TextStyle(fontSize: 28,color: AppColors.primary,fontWeight: FontWeight.w600),),
                Text("Please enter the 4 digital verification code sent to your mobile  number +91-7587329682 via SMS",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400),),
                SizedBox(height: 100,),
                 Pinput(
                   length: 4,
                   validator: (value){

                   },
                   defaultPinTheme: PinTheme(
                     width: 42,
                     height: 44,
                     textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                     decoration: BoxDecoration(
                       color: Colors.transparent, // ✅ Background transparent
                       border: Border.all(color: Color(0xffCCCCCC)), // Border color
                       borderRadius: BorderRadius.circular(8), // Rounded corners
                     ),
                   ),
                 ),
                SizedBox(height: 70,),
                resendOptWidget(),
                SizedBox(height: 100,),
                BasicAppButton(title: "Verify OTP", onPress: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_)=>NamePage()));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  Widget resendOptWidget(){
    return Column(
      children: [
        Text("Didn’t receive OTP?",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff757474)),),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Resend OTP",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor:Color(0xff191919),
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff191919)
                ),
              ),
            ),
            SizedBox(width: 4),
            Text("in 0:23 Sec",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff191919)),),


          ],
        ),      ],
    );
  }
}
