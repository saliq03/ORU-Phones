
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/home/widgets/app_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/banners.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_components.dart';


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



              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("What’s on your mind?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff525252)),)
                    ],
                  ),
                )
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 400,
                  color: Colors.pink,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 400,
                  color: Colors.black45,
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

