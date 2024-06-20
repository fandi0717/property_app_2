// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:property_app/features/property/presentation/bloc/property_bloc.dart';
import 'package:property_app/features/property/presentation/widgets/custom_text_widget.dart';
import 'package:property_app/features/property/presentation/widgets/custom_transaction_menu_widget.dart';
import 'package:property_app/features/property/presentation/widgets/row_state_property.dart';

import '../../../../../../utils/app_constants.dart';

class EksplorProperti extends StatelessWidget {
  const EksplorProperti({
    super.key,
    required this.state,
  });
  final PropertyLoaded state;

  @override
  Widget build(BuildContext context) {
    var listTahapan = <Widget>[
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Pemesanan",
          img: "${AppConstants.IMAGES}tahap_pemesanan.png",
          percentage: state.property.property[state.index].transaction[0]
              .tahapPemesanan!.progress!,
          backgroundColor: const Color.fromRGBO(51, 74, 52, 1),
          scale: 1,
          leftShadow: 56.w, // or 52.r
          bottomShadow: -37.h, // or -16.r

          index: 0),
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Administrasi",
          img: "${AppConstants.IMAGES}tahap_administrasi.png",
          percentage: state.property.property[state.index].transaction[1]
              .tahapAdministrasi!.progress!,
          scale: 0.8,
          leftShadow: -38.w,
          topShadow: 73.h,
          index: 1),
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Pembangunan",
          img: "${AppConstants.IMAGES}tahap_pembangunan.png",
          percentage: state.property.property[state.index].transaction[2]
              .tahapPembangunan!.progress!,
          scale: 0.8,
          leftShadow: -42.w,
          topShadow: 77.h,
          index: 2),
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Akad & Serah Terima",
          img: "${AppConstants.IMAGES}tahap_akad_serah_terima.png",
          percentage: state.property.property[state.index].transaction[3]
              .tahapAkadSerahTerima!.progress!,
          scale: 0.8,
          leftShadow: -35.w,
          topShadow: 70.h,
          imgAlign: Alignment.bottomCenter,
          index: 3)
    ];

    print("${MediaQuery.sizeOf(context).height}");
    print("${MediaQuery.sizeOf(context).width}");
    print('cara chatgpt : ${(144 / 1140 * 926).h}');
    print('cara biasa : ${144.h}');
    print('378.w : ${378.w}');
    print('144.h : ${144.w}');
    print('378.r : ${378.r}');
    print('144.r : ${144.r}');
    print('378.w / 144.h : ${378.w / 144.h}');
    print('378.r / 144.r : ${378.r / 144.r}');
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // head
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesanan Terbaru',
                  style: TextStyle(
                      fontFamily: AppConstants.OUTFIT,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      height: 22.68 / 18,
                      color: const Color.fromRGBO(51, 74, 52, 1)),
                ),
                Text(
                  'Daftar pesanan terbaru anda',
                  style: TextStyle(
                      fontFamily: AppConstants.OUTFIT,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      height: 15.12 / 12,
                      color: const Color.fromRGBO(158, 158, 158, 1)),
                ),
              ],
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.read<PropertyBloc>().add(RemovePropertyEvent());
              },
              child: SvgPicture.asset(
                '${AppConstants.ICON_UTILS}arrow_right.svg',
                width: 24.r,
                height: 24.r,
                colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(51, 74, 52, 1), BlendMode.srcIn),
              ),
            )
          ],
        ),

        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Gap(20.h),

            // timelines
            CustomTextWidget(
                text: state.property.property[state.index].price.toString()),

            Gap(10.h),

            // slider property

            CarouselSlider.builder(
              itemCount: state.property.property.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      color: Colors.white),
                  padding: const EdgeInsets.all(15).r,
                  child: Column(
                    children: [
                      Container(
                        width: 348.w,
                        height: 19.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: "#${state.property.property[index].id}",
                            ),
                            Container(
                              // width: 63.w,
                              // height: 19.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25).r,
                                  color: const Color.fromRGBO(154, 202, 62, 1)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 8.w),
                              child: const Center(
                                child: CustomTextWidget(
                                  text: 'Komersil',
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Gap(10.h),
                      Row(
                        children: [
                          // img,
                          ClipRRect(
                              borderRadius: BorderRadius.circular(11.33).r,
                              child: Image.asset(
                                state.property.property[index].img!,
                                fit: BoxFit.cover,
                                width: 100.w,
                                // height: (85 / 1140 * 926).h,
                                height: 85.h,
                              )),

                          Gap(15.w),
                          // column text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowStatePropertyWidget(
                                icon: 'home.svg',
                                text: state.property.property[index].name!,
                              ),
                              Gap(7.h),
                              RowStatePropertyWidget(
                                icon: 'location.svg',
                                text: state.property.property[index].location!,
                              ),
                              Gap(7.h),
                              RowStatePropertyWidget(
                                icon: 'calendar.svg',
                                text: state.property.property[index].deadlines
                                    .toString(),
                              ),
                              Gap(7.h),
                              RowStatePropertyWidget(
                                price: state.property.property[index].price,
                              ),
                            ],
                          )
                        ],
                      ),
                      // if denda is not null
                      if (state.property.property[index].fine != null)
                        Column(
                          children: [
                            Gap(10.h),
                            const DottedLine(
                              dashColor: Color.fromRGBO(171, 171, 171, 1),
                            ),
                            Gap(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // rupiah denda
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        '${AppConstants.ICON_UTILS}dollar.svg',
                                        width: 14.r,
                                        height: 14.r,
                                        colorFilter: const ColorFilter.mode(
                                            Color.fromRGBO(51, 74, 52, 1),
                                            BlendMode.srcIn)),
                                    Gap(5.w),
                                    const CustomTextWidget(text: 'Denda Rp '),
                                    CustomTextWidget(
                                      text: state.property.property[index].fine!
                                          .toString(),
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                // terlambat : ... hari
                                Container(
                                  // width: 104.w,
                                  // height: 21.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25).r,
                                      color:
                                          const Color.fromRGBO(51, 74, 52, 1)),
                                  padding: EdgeInsets.only(
                                      top: 4.h,
                                      right: 9.w,
                                      bottom: 4.h,
                                      left: 7.w),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        '${AppConstants.ICON_UTILS}warning.svg',
                                        width: 10.r,
                                        height: 10.r,
                                        colorFilter: const ColorFilter.mode(
                                            Color.fromRGBO(255, 255, 255, 1),
                                            BlendMode.srcIn),
                                      ),
                                      Gap(3.w),
                                      const CustomTextWidget(
                                        text: 'Terlambat 7 Hari',
                                        size: 10,
                                        lineHeight: 12.6,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                // height: (144 / 1140 * 926).h,
                // aspectRatio:  378.r / 144.r, // denda tidak null
                // aspectRatio: 378.r / 185.r, // denda is null
                aspectRatio: state.property.property[state.index].fine != null
                    ? (378.r / 185.r)
                    : (378.r / 144.r), // denda is null
                // aspectRatio: 16 / 6.5,
                padEnds: false,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onScrolled: (value) {
                  context.read<PropertyBloc>().add(ScrolledSliderPropertyEvent(
                      property: state.property,
                      // index: value!.toInt()
                      index: value!.floor()));
                  // print("value : $value");
                },
                initialPage: state.index,
              ),
            ),

            Gap(10.h),

            // indicator slider
            DotsIndicator(
              dotsCount: state.property.property.length,
              position: state.index,
              decorator: DotsDecorator(
                  // color: const Color.fromRGBO(222, 221, 221, 1), // inactice color
                  // activeColor: const Color.fromRGBO(51, 74, 52, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r,
                      side: const BorderSide(
                          color: Color.fromRGBO(222, 221, 221, 1))),
                  size: Size(15.w, 3.r),
                  // size: Size(15.w, 10.r),
                  activeSize: Size(19.w, 3.r),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r,
                      side: const BorderSide(
                          color: Color.fromRGBO(51, 74, 52, 1))),
                  spacing: EdgeInsets.only(right: 4.w)),
            ),

            Gap(25.h),

            // row text menu & icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // column text
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Menu',
                      weight: FontWeight.w500,
                      size: 18,
                      lineHeight: 22.68,
                    ),
                    CustomTextWidget(
                      text: 'Daftar menu transaksi',
                      color: Color.fromRGBO(155, 155, 155, 1),
                    )
                  ],
                ),
                // icon
                SvgPicture.asset(
                  '${AppConstants.ICON_UTILS}twotoon_category.svg',
                  width: 24.r,
                  height: 24.r,
                  colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(51, 74, 52, 1), BlendMode.srcIn),
                )
              ],
            ),

            Gap(20.h),

            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 181.5 / 174),
              itemBuilder: (context, index) {
                // make a widget customTransactionMenu
                // print(
                //     "listTahapan ke - 2 : ${(listTahapan[1] as CustomTransactionMenuWidget).percentage}");
                return listTahapan[index];
              },
            )

            // head menu transaction
            // menu transaction using grid
          ],
        ))),
      ],
    );
  }
}
