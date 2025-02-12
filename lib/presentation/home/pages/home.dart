
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oruphones_assignment/core/configs/assets/app_images.dart';
import 'package:oruphones_assignment/core/configs/constants/constants.dart';
import 'package:oruphones_assignment/presentation/home/widgets/app_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/banners.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_components.dart';
import 'package:oruphones_assignment/presentation/home/widgets/whats_on_your_mind.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:

        CustomScrollView(
            slivers: [
              AppBarHome(),
              SearchBarHome(),
              SearchComponentsHome(),
              BannersWidget(),
              giveSpace(height: 20),
              WhatsOnYourMindWidget(),
              giveSpace(height: 30),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top brands",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Color(0xff525252)),),
                          Icon(CupertinoIcons.forward,color: Color(0xff525252),)
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 65,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Container(
                              margin: EdgeInsets.only(left: 15),
                              height: 64,width: 64,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF2F2F2),
                              ),
                              child: SvgPicture.asset('assets/vectors/oppo.svg'),
                            );
                          },itemCount: 9,),
                    )
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return Container(margin : EdgeInsets.symmetric(vertical: 10),height: 30,color: Colors.black,);
                },),


              ),



            ],
        )

      ),
    );
  }

Widget giveSpace({double? height,double? width}){
 return SliverToBoxAdapter(child: SizedBox(
   height: height?? 10,
   width: width??10,),);

}

}

