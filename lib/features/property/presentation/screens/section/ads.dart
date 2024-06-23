import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_constants.dart';
import '../../widgets/slider_ads_widget.dart';

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
                ? AppConstants.LIME_GREEN
                : AppConstants.DARK_OLIVE_GREEN,
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
