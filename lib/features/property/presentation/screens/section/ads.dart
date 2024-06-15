import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/features/property/presentation/widgets/slider_ads_widget.dart';

class AdsSection extends StatelessWidget {
  const AdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 2,
        itemBuilder: (context, index, realIndex) {
          return SliderAdsWidget(
            index: index,
            backgroundColor: index.isOdd
                ? const Color.fromRGBO(154, 202, 62, 1)
                : const Color.fromRGBO(51, 74, 52, 1),
          );
        },
        options: CarouselOptions(
            height: 155.h,
            padEnds: false,
            autoPlay: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.95));
  }
}
