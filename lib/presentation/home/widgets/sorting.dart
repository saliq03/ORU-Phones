import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortingWidgetHome extends StatelessWidget {
  const SortingWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Best deals ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff525252), // Your original color
                    ),
                  ),
                  TextSpan(
                    text: "in India",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3F3E8F), // Red asterisk
                    ),
                  ),
                ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
               sortContainer(title: "Sort",prefixIcon:CupertinoIcons.arrow_up_arrow_down,suffixIcon: Icons.expand_more_sharp ),
                sortContainer(title: "Filters",prefixIcon:CupertinoIcons.slider_horizontal_3,suffixIcon: Icons.expand_more_sharp ),
                sortContainer(title: 'Nearby Deals'),
                sortContainer(title: 'Verified Deals'),
                sortContainer(title: 'Deals in 50km'),
                sortContainer(title: 'Deals in 250km'),

              ],),
            )
          ]

      ),
    );
  }

  Widget sortContainer({IconData? prefixIcon,required String title,IconData? suffixIcon}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Color(0xffD7D7D7),
              width: 1
          )
      ),
      child: Row(
        children: [
          prefixIcon==null? SizedBox.shrink():Icon(prefixIcon,color: Color(0xff121212),size: 13,),
          SizedBox(width: 5,),
          Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff121212)),),
          SizedBox(width: 5,),
          suffixIcon==null? SizedBox.shrink():Icon(suffixIcon,color: Color(0xff121212),size: 13,)
        ],),
    );
  }
}
