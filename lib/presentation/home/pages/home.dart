import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/home/widgets/app_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/banners.dart';
import 'package:oruphones_assignment/presentation/home/widgets/floating_button.dart';
import 'package:oruphones_assignment/presentation/home/widgets/grid_items.dart';
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
              GridItemsWidget(),
              giveSpace(height: 30),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 222,
                      width: double.infinity,
                      color: Color(0xffF6C018),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Get Notified About Our\nLatest Offers and Price Drops", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,color: Color(0xff000000),),)
                        ],
                      ),
                    )
                  ],
                ),
              )


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

