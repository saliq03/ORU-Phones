
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/home/widgets/app_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/banners.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_components.dart';
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
        ),
        floatingActionButton:  Padding(
          padding: const EdgeInsets.only(bottom: 20.0), // Bottom padding
          child: SizedBox(
            width: 105,
            height: 51,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xff363636),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44),
                side: BorderSide(
                  color: Color(0xffF6C018),
                  width: 4
                )
              ),
              child: Row(children: [
                Text("Sell")
              ],), // Custom icon
            ),
          ),
        ),
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

