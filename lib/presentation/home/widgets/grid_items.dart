import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones_assignment/data/models/product.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/login_mobile_bottom_sheet.dart';
import 'package:oruphones_assignment/presentation/auth/widgets/verifiy_otp_bottom_sheet.dart';
import 'package:oruphones_assignment/presentation/home/bloc/home_bloc.dart';
import '../../../core/configs/assets/app_images.dart';

class GridItemsWidget extends StatelessWidget {
   GridItemsWidget({super.key});
  List<int> bannerPositions = [4, 12,];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    if(state.products.isEmpty){
      return Center(child: CircularProgressIndicator());
    }
    else{
      return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          shrinkWrap: true,
          primary: false,
          itemCount: state.products.length+bannerPositions.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 174 / 292,
              crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemBuilder:(context,index){
            if (bannerPositions.contains(index + 1)) {
              int adIndex = bannerPositions.indexOf(index + 1);
              return adWidget(adIndex);
            }
            else{
              int itemIndex = index - bannerPositions.where((pos) => pos <= index + 1).length; // Adjust index for banners
              return itemWidget(state.products[itemIndex],context);
            }

          });
    }

  },
),
    );
  }
  
  
  
  Widget itemWidget(ProductModel product,BuildContext context){
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
                    image:product.images!.isNotEmpty?
                    NetworkImage(
                      product.images![0].thumbImage!):
                AssetImage(AppImages.practiceImage)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     product.images!.isNotEmpty&&product.images![0].isVarified=="accepted"?Image.asset(AppImages.ORUVerified):SizedBox(width: 1,),
                      IconButton(onPressed: (){
                        _showLoginMobileBottomSheet(context);
                      }, icon: Icon(Icons.favorite_outline_outlined,color: Color(0xffFFFFFF),
                        shadows: [BoxShadow(
                          color: Color(0x66FFFFFF),
                          blurRadius: 10,
                          spreadRadius: 5,),],),
                      )

                    ],),
                  product.openForNegotiation==true?ClipRect(
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
                  ):SizedBox.shrink()
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.marketingName!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xff171717),)),
                SizedBox(height: 3,),
                Text("${product.deviceStorage!} • ${product.deviceCondition}",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff6D6D6D))),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "₹ ${product.listingPrice!}   ",
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
                    child: Text('${product.listingLocation},${product.listingState}!',maxLines:1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff7D7D7D)),)),
                Text("July 25th",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff7D7D7D)),),
              ],),
          )

        ],
      ),
    );
  }
   Widget adWidget(int index){
     return Container(
       decoration: BoxDecoration(
           image: DecorationImage(
               fit: BoxFit.cover,
               image:AssetImage(AppImages.itemCardAds[index]) )
       ),
     );
   }

   void _showLoginMobileBottomSheet(BuildContext context){
    showModalBottomSheet(
       isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))
        ),
        builder: (context)=>LoginMobileBottomSheet());
   }


}
