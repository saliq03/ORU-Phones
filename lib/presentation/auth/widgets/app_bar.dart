import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oruphones_assignment/presentation/home/pages/home.dart';

import '../../../core/configs/assets/app_vectors.dart';

class AppBarAuth extends StatelessWidget {
 const  AppBarAuth({super.key,this.hideBack=false});
  final bool hideBack;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ 
        hideBack?SizedBox():IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_outlined,size: 30,color: Colors.black,)),
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
                  (route) => false,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(AppVectors.cross,width: 20,height: 20,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),),
          ),
        ),
      ],);
  }
}
