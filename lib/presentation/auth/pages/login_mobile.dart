import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:oruphones_assignment/common/buttons/basic_app_button.dart';
import 'package:oruphones_assignment/core/configs/assets/app_images.dart';
import 'package:oruphones_assignment/core/configs/assets/app_vectors.dart';
import 'package:oruphones_assignment/core/configs/colors/app_colors.dart';
import 'package:oruphones_assignment/presentation/auth/pages/verify_otp.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/app_bar.dart';

class LoginMobilePage extends StatelessWidget {
   LoginMobilePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBarAuth(hideBack: true,),
                 SizedBox(width: double.infinity,height: 60,),
                 SvgPicture.asset(AppVectors.logo,width: 116,height: 61,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),),
                  SizedBox(height: 50,),
                  Text("Welcome",style: TextStyle(fontSize: 28,color: AppColors.primary,fontWeight: FontWeight.w600),),
                  Text("Sign in to continue",style: TextStyle(color: Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400),),
                  SizedBox(height: 100,),
                  phoneField(),
                  SizedBox(height: 100,),
                  termsAndConditionsWidget(),
                  SizedBox(height: 5,),
                  BasicAppButton(title: "Next", onPress: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>VerifyOtpPage()));
                    }
                  },icon: Icons.arrow_forward_rounded,)
                ],
              ),
            ),
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
          keyboardType: TextInputType.phone,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            hintText: "Mobile Number",
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 10),
              child: Text("+91",style: TextStyle(
                color: Color(0xFF757474),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),),
            )
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your mobile number";
            } else if (value.length != 10) {
              return "Mobile number must be 10 digits";
            }
          else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
            return "Enter a valid 10-digit mobile number";
          }
            return null; // Valid input
          },
        )
      ],
    );
  }
  Widget termsAndConditionsWidget(){
    bool checkboxvalue=false;
    return Row(
      children: [
        Checkbox(

          value: checkboxvalue,
          onChanged: (value) {
            checkboxvalue = value!;
          },
        ),
        SizedBox(width: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Accept",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            SizedBox(width: 4),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Terms and Condition",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                    fontSize: 14,fontWeight: FontWeight.w400
                ),
              ),
            ),
          ],
        ),
      ],
    )
    ;

  }
}
