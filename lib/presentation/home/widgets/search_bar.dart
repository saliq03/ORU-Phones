import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones_assignment/presentation/home/widgets/sliver_app_bar_deligate.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate:SliverAppBarDelegate(child: Container(
        color: Color(0xE6FFFFFF),
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Container(

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: Color(0xffE0E0E0),
                  width: 1)
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: false,
                    hintText: "Search phones with make,model...",
                    hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff707070)),
                    prefixIcon: Icon(Icons.search,color: Color(0xffF7C04A),),


                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,),
                  ),
                ),
              ),
              Text("|",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Color(0xff707070)),),
              SizedBox(width: 7,),
              Icon(CupertinoIcons.mic,color: Color(0xff707070),size: 20,),
              SizedBox(width: 10,)

            ],
          ),
        ),
      ))
    );
  }
}
