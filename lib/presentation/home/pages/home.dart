import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/home/widgets/app_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_bar.dart';
import 'package:oruphones_assignment/presentation/home/widgets/search_components.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 400,
                  color: Colors.blue,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 400,
                  color: Colors.red,
                ),
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
      
            ],
        )
      
      ),
    );
  }


}

