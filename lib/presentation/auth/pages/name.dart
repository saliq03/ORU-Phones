import 'package:flutter/material.dart';

import '../../../common/buttons/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../widgets/app_bar.dart';

class NamePage extends StatelessWidget {
   NamePage({super.key});

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
                  Container(
                    width: 170,height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImages.logo))
                    ),),
                  SizedBox(height: 50,),
                  Text("Welcome",style: TextStyle(fontSize: 28,color: AppColors.primary,fontWeight: FontWeight.w600),),
                  Text("Sign in to continue",style: TextStyle(color: Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400),),
                  SizedBox(height: 100,),
                  nameField(),
                  SizedBox(height: 100,),

                  BasicAppButton(title: "Next", onPress: (){
                    if(_formKey.currentState!.validate()){
                     // Navigator.push(context, MaterialPageRoute(builder: (_)=>VerifyOtpPage()));
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

  Widget nameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        RichText(
          text: TextSpan(children: [
              TextSpan(
                text: "Please Tell Us Your Name ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff282828), // Your original color
                ),
              ),
              TextSpan(
                text: "*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, // Red asterisk
                ),
              ),
            ],
          ),
        ),


        TextFormField(
          keyboardType: TextInputType.text,

          decoration: InputDecoration(
              hintText: "Name",

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your name";
            }
            return null; // Valid input
          },
        )
      ],
    );
  }

}
