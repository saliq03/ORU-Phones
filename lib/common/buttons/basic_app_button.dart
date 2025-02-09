import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    required this.title,required this.onPress,
    this.height,
    this.loading=false,
    this.icon,
    super.key});
  final VoidCallback onPress;
  final String title;
  final double? height;
  final IconData? icon;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress,
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height?? 51)
        ),
        child: loading?const Center(child: CircularProgressIndicator(color: Colors.white,))
            :Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(width: 5,),
                icon==null?SizedBox.shrink(): Icon(icon,color: Colors.white,size: 24,)
              ],
            ));
  }
}
