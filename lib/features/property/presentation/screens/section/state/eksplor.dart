// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:timelines/timelines.dart';

import '../../../../../../core/functions/indonesia.dart';
import '../../../../../../utils/app_constants.dart';
import '../../../../domain/entities/property_entity.dart';
import '../../../bloc/property_bloc.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/custom_transaction_menu_widget.dart';
import '../../../widgets/row_state_property.dart';

class EksplorProperti extends StatelessWidget {
  const EksplorProperti({
    super.key,
    required this.state,
  });
  final PropertyLoaded state;

  double getProgress(Transaction transaction, int index) {
    switch (index) {
      case 0:
        return transaction.tahapPemesanan!.progress!;
      case 1:
        return transaction.tahapAdministrasi!.progress!;
      case 2:
        return transaction.tahapPembangunan!.progress!;
      case 3:
        return transaction.tahapAkadSerahTerima!.progress!;
      default:
        return 0.0;
    }
  }

  final Map<int, String> mapping = const <int, String>{
    0: "Pemesanan",
    1: "Administrasi",
    2: "Pembangunan",
    3: "Serah Terima"
  };

  @override
  Widget build(BuildContext context) {
    var listTahapan = <Widget>[
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Pemesanan",
          img: "${AppConstants.IMAGES}tahap_pemesanan.png",
          percentage: state.property.property[state.index].transaction[0]
              .tahapPemesanan!.progress!,
          transaction: state.property.property[state.index].transaction[0],
          backgroundColor: AppConstants.DARK_OLIVE_GREEN,
          scale: 1,
          leftShadow: 56.w, // or 52.r
          bottomShadow: -37.h, // or -16.r

          index: 0),
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Administrasi",
          img: "${AppConstants.IMAGES}tahap_administrasi.png",
          transaction: state.property.property[state.index].transaction[1],
          percentage: state.property.property[state.index].transaction[1]
              .tahapAdministrasi!.progress!,
          scale: 0.8,
          leftShadow: -38.w,
          topShadow: 73.h,
          index: 1),
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Pembangunan",
          img: "${AppConstants.IMAGES}tahap_pembangunan.png",
          transaction: state.property.property[state.index].transaction[2],
          percentage: state.property.property[state.index].transaction[2]
              .tahapPembangunan!.progress!,
          scale: 0.8,
          leftShadow: -42.w,
          topShadow: 77.h,
          index: 2),
      CustomTransactionMenuWidget(
          namaTahap: "Tahap Akad & Serah Terima",
          img: "${AppConstants.IMAGES}tahap_akad_serah_terima.png",
          transaction: state.property.property[state.index].transaction[3],
          percentage: state.property.property[state.index].transaction[3]
              .tahapAkadSerahTerima!.progress!,
          scale: 0.8,
          leftShadow: -35.w,
          topShadow: 70.h,
          imgAlign: Alignment.bottomCenter,
          index: 3)
    ];

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // head
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: 'Pesanan Terbaru',
                  weight: FontWeight.w500,
                  size: 18,
                  lineHeight: 22.68,
                ),
                CustomTextWidget(
                  text: 'Daftar pesanan terbaru anda',
                  color: AppConstants.SILVER,
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
                    AppConstants.DARK_OLIVE_GREEN, BlendMode.srcIn),
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
            Container(
                height: 56.h,
                decoration: BoxDecoration(
                    color: AppConstants.WHITE,
                    borderRadius: BorderRadius.circular(10).r),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                child: FixedTimeline.tileBuilder(
                    direction: Axis.horizontal,
                    builder: TimelineTileBuilder.connected(
                      nodePositionBuilder: (context, index) => 0,
                      indicatorPositionBuilder: (context, index) => 0,
                      itemExtent: 87.w,
                      itemCount: 4,
                      connectionDirection: ConnectionDirection.after,
                      contentsBuilder: (context, index2) {
                        double progress = getProgress(
                            state.property.property[state.index]
                                .transaction[index2],
                            index2);
                        return Container(
                          margin: EdgeInsets.only(top: 4.h),
                          alignment: Alignment.centerLeft,
                          child: CustomTextWidget(
                              text: mapping.values.toList()[index2],
                              size: 10,
                              lineHeight: 12.6,
                              color: progress > 0.0
                                  ? AppConstants.DARK_OLIVE_GREEN
                                  : AppConstants.SILVER_2),
                        );
                      },
                      indicatorBuilder: (context, index2) {
                        double progress = getProgress(
                            state.property.property[state.index]
                                .transaction[index2],
                            index2);

                        if (progress == 100.0) {
                          return DotIndicator(
                            child: SvgPicture.asset(
                              '${AppConstants.ICON_UTILS}checklist.svg',
                              width: 15.r,
                              height: 15.r,
                            ),
                          );
                        } else if (progress == 0.0) {
                          return DotIndicator(
                            child: SvgPicture.asset(
                              '${AppConstants.ICON_UTILS}cd.svg',
                              width: 15.r,
                              height: 15.r,
                            ),
                          );
                        }
                        return DotIndicator(
                          child: SvgPicture.asset(
                            '${AppConstants.ICON_UTILS}half_clock.svg',
                            width: 15.r,
                            height: 15.r,
                          ),
                        );
                      },
                      connectorBuilder: (context, index2, type) {
                        double progress = getProgress(
                            state.property.property[state.index]
                                .transaction[index2],
                            index2);

                        if (progress == 100.0) {
                          return const SolidLineConnector(
                            color: AppConstants.DARK_OLIVE_GREEN,
                          );
                        }
                        return const DashedLineConnector(
                          color: AppConstants.SILVER_2,
                        );
                      },
                      lastConnectorBuilder: (context) {
                        double progress = getProgress(
                            state.property.property[state.index].transaction[3],
                            3);
                        if (progress == 100.0) {
                          return const SolidLineConnector(
                            color: AppConstants.DARK_OLIVE_GREEN,
                          );
                        }
                        return const DashedLineConnector(
                          color: AppConstants.SILVER_2,
                        );
                      },
                    ))),

            Gap(10.h),

            // slider property
            CarouselSlider.builder(
              itemCount: state.property.property.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      color: AppConstants.WHITE),
                  padding: const EdgeInsets.all(15).r,
                  child: Column(
                    children: [
                      SizedBox(
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
                                  color: AppConstants.LIME_GREEN),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 8.w),
                              child: const Center(
                                child: CustomTextWidget(
                                  text: 'Komersil',
                                  color: AppConstants.WHITE,
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
                                  text: formatDateTime(state
                                      .property.property[index].deadlines!)),
                              Gap(7.h),
                              RowStatePropertyWidget(
                                  // price: state.property.property[index].price,
                                  price: formatRupiah(
                                      state.property.property[index].price!)),
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
                              dashColor: AppConstants.SILVER_2,
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
                                            AppConstants.DARK_OLIVE_GREEN,
                                            BlendMode.srcIn)),
                                    Gap(5.w),
                                    const CustomTextWidget(text: 'Denda Rp '),
                                    CustomTextWidget(
                                      text: formatRupiah(
                                          state.property.property[index].fine!),
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
                                      color: AppConstants.DARK_OLIVE_GREEN),
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
                                            AppConstants.WHITE,
                                            BlendMode.srcIn),
                                      ),
                                      Gap(3.w),
                                      CustomTextWidget(
                                        text:
                                            'Terlambat ${state.property.property[index].currentDate!.difference(state.property.property[index].deadlines!).inDays} hari',
                                        size: 10,
                                        lineHeight: 12.6,
                                        color: AppConstants.WHITE,
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r,
                      side: const BorderSide(color: AppConstants.LIGHT_GRAY_2)),
                  size: Size(15.w, 3.r),
                  activeSize: Size(19.w, 3.r),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r,
                      side: const BorderSide(
                          color: AppConstants.DARK_OLIVE_GREEN)),
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
                      color: AppConstants.MEDIUM_GRAY,
                    )
                  ],
                ),
                // icon
                SvgPicture.asset(
                  '${AppConstants.ICON_UTILS}twotoon_category.svg',
                  width: 24.r,
                  height: 24.r,
                  colorFilter: const ColorFilter.mode(
                      AppConstants.DARK_OLIVE_GREEN, BlendMode.srcIn),
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
                return listTahapan[index];
              },
            )
          ],
        ))),
      ],
    );
  }
}
