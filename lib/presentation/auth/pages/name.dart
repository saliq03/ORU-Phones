import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/presentation/auth/bloc/auth_bloc.dart';
import 'package:oruphones_assignment/service_locator.dart';

import '../../../common/buttons/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../widgets/app_bar.dart';

class NamePage extends StatelessWidget {
   NamePage({super.key,required this.cookie});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final TextEditingController controller=TextEditingController();
   final String cookie;
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
                  Text("Sign up to continue",style: TextStyle(color: Color(0xff707070),fontSize: 14,fontWeight: FontWeight.w400),),
                  SizedBox(height: 100,),
                  nameField(),
                  SizedBox(height: 100,),
                  BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return state.nameLoading?Center(child: CircularProgressIndicator()):
                    BasicAppButton(title: "Confirm Name", onPress: (){
                    if(_formKey.currentState!.validate()){
                      context.read<AuthBloc>().add(UpdateUserName(name: controller.text, context: context, cookie: cookie,page: true));
                    }
                  },icon: Icons.arrow_forward_rounded,);
  },
)
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
          controller: controller,
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
