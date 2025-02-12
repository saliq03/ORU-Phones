import 'package:flutter/cupertino.dart';

import '../../../core/configs/assets/app_images.dart';

class WhatsOnYourMindWidget extends StatelessWidget {
  const WhatsOnYourMindWidget({super.key});
  static const List<String> features=['Buy Used Phones','Buy Used Phones',"Compare Prices","My Profile","My Listings","Open Store","Services"];


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text("What’s on your mind?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff525252)),),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    width: 85,
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.features[index],height: 95,fit: BoxFit.cover,),
                        Text(features[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff121212),),)
                      ],
                    ),
                  );
                },itemCount: AppImages.features.length,),
            )
          ],
        )
    );
  }
}
