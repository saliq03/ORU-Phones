import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_vectors.dart';

class BottomSheetAppbar extends StatelessWidget {
  const BottomSheetAppbar({super.key,this.hideBack=false,required this.title});

  final bool hideBack;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: !hideBack,
      leading:hideBack?null:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_outlined,size: 25,color: Colors.black,)),
      title: Text(title),
      actions: [Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
                child: SvgPicture.asset(AppVectors.cross,width: 17,height: 17,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),)),
          ),],
    );
  }
}
