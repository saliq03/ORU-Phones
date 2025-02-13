import 'package:flutter/cupertino.dart';

import '../../../core/configs/assets/app_images.dart';

class TopBrandsWidget extends StatelessWidget {
  const TopBrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  child: Image.asset(AppImages.brands[index]),
                );
              },itemCount: AppImages.brands.length,),
          )
        ],
      ),
    );
  }
}
