import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/home/widgets/sliver_app_bar_deligate.dart';

class SearchComponentsHome extends StatelessWidget {
  const SearchComponentsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          child: Container(
            color: Color(0xE6FFFFFF),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder:(context,index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Color(0xffE0E0E0)
                        )
                    ),
                    child: Center(child: Text("Sell Used phones",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11),)),);
                }, itemCount: 7),
          )
      ),
    );
  }
}
