import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/core/configs/assets/app_images.dart';
import 'package:oruphones_assignment/presentation/home/widgets/app_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/banners.dart';
import 'package:oruphones_assignment/presentation/home/widgets/floating_button.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_components.dart';
import 'package:oruphones_assignment/presentation/home/widgets/sorting.dart';
import 'package:oruphones_assignment/presentation/home/widgets/top_brands.dart';
import 'package:oruphones_assignment/presentation/home/widgets/whats_on_your_mind.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<int> bannerPositions = [4, 12,];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
            slivers: [
              AppBarHome(),
              SearchBarHome(),
              SearchComponentsHome(),
              BannersWidget(),
              giveSpace(height: 20),
              WhatsOnYourMindWidget(),
              giveSpace(height: 30),
              TopBrandsWidget(),
              giveSpace(height: 30),
              SortingWidgetHome(),
              giveSpace(height: 30),
              SliverToBoxAdapter(
                child: GridView.builder(
                     padding: EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10+2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: 174 / 292,
                     crossAxisSpacing: 10,mainAxisSpacing: 10),
                    itemBuilder:(context,index){
                      if (bannerPositions.contains(index + 1)) {
                        return Container(
                          color: Colors.redAccent, // Banner color or design
                          child: Center(
                            child: Text(
                              "Ad Banner",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }
                      else{
                        int itemIndex = index - bannerPositions.where((pos) => pos <= index + 1).length; // Adjust index for banners
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Color(0xffCFCFCF),
                                  width: 1
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 181,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft:  Radius.circular(12),topRight: Radius.circular(12)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(AppImages.practiceImage))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(AppImages.ORUVerified),
                                          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_outlined,color: Color(0xffFFFFFF),
                                            shadows: [BoxShadow(
                                              color: Color(0x66FFFFFF),
                                              blurRadius: 10,
                                              spreadRadius: 5,),],),
                                          )

                                        ],),
                                      ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                          child: Container(
                                            height: 21,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Color(0x664C4C4C)
                                            ),
                                            child: Center(
                                              child: Text("Price Negotiable".toUpperCase(),
                                                style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: Color(0xffDBDBDB)),),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Apple iPhone 13 Pro",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff171717),)),
                                    SizedBox(height: 3,),
                                    Text("12/256 GB • Like New",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff6D6D6D))),
                                    SizedBox(height: 10,),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "₹ 41,500   ",
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color(0xff000000)),
                                        ),

                                        TextSpan(
                                          text: "₹ 81,500",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff707070),
                                            decoration: TextDecoration.lineThrough, // Red asterisk
                                          ),
                                        ),
                                        TextSpan(
                                          text: "  (45% off)",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffE9342B),
                                            // Red asterisk
                                          ),
                                        ),

                                      ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              Container(
                                height: 21,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xB3DFDFDF),
                                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(12) ,bottomLeft:Radius.circular(12) )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 80,
                                        child: Text("Nijampur, Luc.....",maxLines:1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff7D7D7D)),)),
                                    Text("July 25th",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff7D7D7D)),),
                                  ],),
                              )

                            ],
                          ),
                        );
                      }

                    }),
              ),


            ],
        ),


        floatingActionButton:  FloatingButtonHome(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      ),
    );
  }

Widget giveSpace({double? height,double? width}){
 return SliverToBoxAdapter(child: SizedBox(
   height: height?? 10,
   width: width??10,),);

  }

  }

