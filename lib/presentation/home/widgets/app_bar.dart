import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oruphones_assignment/data/sources/api_services.dart';
import 'package:oruphones_assignment/presentation/auth/pages/login_mobile.dart';
import 'package:oruphones_assignment/service_locator.dart';

import '../../../core/configs/assets/app_vectors.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor:Color(0xE6FFFFFF),
      floating: true,
      flexibleSpace: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top: 15,bottom: 10),
          child: Row(
            children: [
              SvgPicture.asset(AppVectors.leading,height: 24,),
              SizedBox(width: 10),
              SvgPicture.asset(AppVectors.logo,height: 27,),
            ],
          ),
        ),
      ),
      actions: [
        setLocationWidget(),
        SizedBox(width: 10,),
        loginButton(context)
      ],
    );
  }

  Widget setLocationWidget(){
    return Row(
      children: [
        Text("India",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
        SizedBox(width: 10,),
        SvgPicture.asset(AppVectors.location)
      ],
    );
  }

  Widget loginButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginMobilePage()));},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 29,width: 66,
        decoration: BoxDecoration(
          color: Color(0xffF6C018),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(child: Text("Login",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}
