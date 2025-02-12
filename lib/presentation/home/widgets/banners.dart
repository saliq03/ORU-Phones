import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/configs/assets/app_images.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: CarouselSlider.builder(
              itemCount: AppImages.banners.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return buildImage(AppImages.banners[index],context);
              },
              options: CarouselOptions(
                  height: 175,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                  onPageChanged: (index,reason){

                  }
              ),),
          ),
          buildIndicator()

        ],
      ),
    );
  }

  Widget buildImage(String image,BuildContext context){
    return ClipRRect(borderRadius: BorderRadius.circular(12),
      child: Hero(tag: image,
        child: Image.asset(image,
          width: double.infinity,
          height: 175,
          fit: BoxFit.cover,),
      ),
    );
  }

  Widget buildIndicator() {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: 2,
        count: AppImages.banners.length,
        effect: JumpingDotEffect(
            activeDotColor: Color(0xffABABAB),
            dotColor: Color(0xffABABAB),
            strokeWidth: 1,
            dotHeight: 5,
            dotWidth: 5,
            paintStyle: PaintingStyle.stroke
        ),
      ),
    );
  }
}
