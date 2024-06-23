// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../../utils/app_constants.dart';
import '../../domain/entities/property_entity.dart';
import 'custom_text_widget.dart';
import 'show_bottom_sheet_widget.dart';

class CustomTransactionMenuWidget extends StatefulWidget {
  CustomTransactionMenuWidget(
      {super.key,
      required this.namaTahap,
      required this.img,
      required this.percentage,
      required this.transaction,
      this.backgroundColor = AppConstants.WHITE,
      required this.index,
      this.imgAlign = Alignment.bottomRight,
      this.scale,
      this.scaleX,
      this.scaleY,
      this.leftShadow,
      this.rightShadow,
      this.topShadow,
      this.bottomShadow}) {
    if (scale != null) {
      assert(scaleX == null && scaleY == null, "You must specify [scale] only");
    }
    if (scaleX != null || scaleY != null) {
      assert(scale == null,
          "You don't have to modify [scale] because you have modified [scaleX] and [scaleY]");
      assert(scaleX != null && scaleY != null,
          "You must specify [scaleX] and [scaleY]");
    }
  }

  final Color backgroundColor;
  final String namaTahap;
  final String img;
  final double percentage;
  final Alignment imgAlign;
  final double? scale;
  final double? scaleX;
  final double? scaleY;
  final double? leftShadow;
  final double? rightShadow;
  final double? bottomShadow;
  final double? topShadow;
  final Transaction transaction;

  /// [sementara mungkin]
  final int index;

  @override
  State<CustomTransactionMenuWidget> createState() =>
      _CustomTransactionMenuWidgetState();
}

class _CustomTransactionMenuWidgetState
    extends State<CustomTransactionMenuWidget> {
  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(widget.percentage);
    // _getProgressPercentage();
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  /*
  void _getProgressPercentage() {
    if (widget.transaction.tahapPemesanan != null) {
      valueNotifier =
          ValueNotifier(widget.transaction.tahapPemesanan!.progress!);
    } else if (widget.transaction.tahapAdministrasi != null) {
      valueNotifier =
          ValueNotifier(widget.transaction.tahapAdministrasi!.progress!);
    } else if (widget.transaction.tahapPembangunan != null) {
      valueNotifier =
          ValueNotifier(widget.transaction.tahapPembangunan!.progress!);
    } else if (widget.transaction.tahapAkadSerahTerima != null) {
      valueNotifier =
          ValueNotifier(widget.transaction.tahapAkadSerahTerima!.progress!);
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    List<String> splitNamaTahap = widget.namaTahap.split(' ');
    bool isTahapPemesanan = splitNamaTahap[1] == "Pemesanan";
    bool isTahapAdministrasi = splitNamaTahap[1] == "Administrasi";

    if (widget.percentage != valueNotifier.value) {
      valueNotifier.value = widget.percentage;
    }

    return GestureDetector(
        onTap: () {
          switch (widget.index) {
            case 0:
              showBottomSheetWidget(context, widget.index,
                  tahapPemesanan: widget.transaction.tahapPemesanan);
            case 1:
              showBottomSheetWidget(context, widget.index,
                  tahapAdministrasi: widget.transaction.tahapAdministrasi);
            case 2:
              showBottomSheetWidget(context, widget.index,
                  tahapPembangunan: widget.transaction.tahapPembangunan);
            case 3:
              showBottomSheetWidget(context, widget.index,
                  tahapAkadSerahTerima:
                      widget.transaction.tahapAkadSerahTerima);
          }
        },
        // behavior: HitTestBehavior.translucent,
        child: Opacity(
          opacity: widget.percentage > 0.0 ? 1 : 0.6,
          child: Container(
              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(13).r,
                  boxShadow: isTahapPemesanan
                      ? [
                          BoxShadow(
                              offset: Offset(0, 4.12.h),
                              blurRadius: 2.47.r,
                              color: AppConstants.SEMI_TRANSPARENT_DARK_GRAY),
                          BoxShadow(
                              offset: Offset(0, 10.42.h),
                              blurRadius: 6.25.r,
                              color: AppConstants.SEMI_TRANSPARENT_DARK_GRAY_2),
                          BoxShadow(
                              offset: Offset(0, 21.27.h),
                              blurRadius: 12.76.r,
                              color: AppConstants.SEMI_TRANSPARENT_DARK_GRAY_3),
                          BoxShadow(
                              offset: Offset(0, 43.8.h),
                              blurRadius: 26.28.r,
                              color: AppConstants.SEMI_TRANSPARENT_DARK_GRAY_4),
                          BoxShadow(
                              offset: Offset(0, 120.h),
                              blurRadius: 72.r,
                              color: AppConstants.SEMI_TRANSPARENT_DARK_GRAY_5),
                        ]
                      : isTahapAdministrasi
                          ? [
                              BoxShadow(
                                  offset: Offset(0, 14.1.h),
                                  blurRadius: 5.32.r,
                                  color: AppConstants
                                      .SEMI_TRANSPARENT_DARK_GRAY_6),
                              BoxShadow(
                                  offset: Offset(0, 47.35.h),
                                  blurRadius: 17.87.r,
                                  color: AppConstants
                                      .SEMI_TRANSPARENT_DARK_GRAY_7),
                              BoxShadow(
                                  offset: Offset(0, 212.h),
                                  blurRadius: 80.r,
                                  color: AppConstants
                                      .SEMI_TRANSPARENT_DARK_GRAY_8),
                            ]
                          : null),
              child: Stack(
                children: [
                  // background shadow
                  isTahapPemesanan
                      ? ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(13).r,
                            bottomRight: const Radius.circular(13).r,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  left: widget.leftShadow,
                                  right: widget.rightShadow,
                                  bottom: widget.bottomShadow,
                                  top: widget.topShadow,
                                  child: ClipOval(
                                    child: Container(
                                        width: 198,
                                        height: 219,
                                        color: AppConstants.DARK_GREEN),
                                  ))
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(13).r,
                            bottomRight: const Radius.circular(13).r,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: widget.leftShadow,
                                right: widget.rightShadow,
                                bottom: widget.bottomShadow,
                                top: widget.topShadow,
                                child: ClipOval(
                                  child: Container(
                                      width: 296,
                                      height: 296,
                                      color: AppConstants.PURE_WHITE),
                                ),
                              )
                            ],
                          )),

                  // content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // nama tahap
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: splitNamaTahap[0],
                              fontFamily: AppConstants.LEXEND,
                              weight: FontWeight.w300,
                              lineHeight: 15,
                              color: isTahapPemesanan
                                  ? AppConstants.WHITE
                                  : AppConstants.DARK_OLIVE_GREEN,
                            ),
                            Gap(isTahapPemesanan ? 5.h : 1.h),
                            CustomTextWidget(
                              text: splitNamaTahap.sublist(1).join(" "),
                              fontFamily: AppConstants.LEXEND,
                              weight: FontWeight.w500,
                              size: 14,
                              lineHeight: 17.5,
                              color: isTahapPemesanan
                                  ? AppConstants.WHITE
                                  : AppConstants.DARK_OLIVE_GREEN,
                            ),
                          ],
                        ),
                      ),
                      // percetage & img
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 15)
                                      .r,
                              child: Container(
                                  width: 35.r,
                                  height: 35.r,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.backgroundColor,
                                      boxShadow: widget.percentage == 0.0
                                          ? null
                                          : [
                                              const BoxShadow(
                                                  blurRadius: 2.5,
                                                  spreadRadius: 0,
                                                  color: AppConstants
                                                      .SEMI_TRANSPARENT_DARK_GREEN_2,
                                                  offset: Offset(0, 5))
                                            ]),
                                  child: SimpleCircularProgressBar(
                                    backStrokeWidth: 3,
                                    progressStrokeWidth: 3,
                                    progressColors: isTahapPemesanan
                                        ? [AppConstants.SALMON_PINK]
                                        : [AppConstants.DARK_OLIVE_GREEN],
                                    backColor: isTahapPemesanan
                                        ? AppConstants.WHITE
                                        : AppConstants.SOFT_GREEN,
                                    mergeMode: true,
                                    onGetText: (double value) {
                                      return Text.rich(TextSpan(
                                          text: value.toInt().toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: AppConstants.RUBIK,
                                              height: 14.22 / 12,
                                              fontSize: 12.sp,
                                              color: isTahapPemesanan
                                                  ? AppConstants.WHITE
                                                  : AppConstants
                                                      .DARK_OLIVE_GREEN),
                                          children: [
                                            TextSpan(
                                              text: '%',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      AppConstants.RUBIK,
                                                  height: 5.93 / 5,
                                                  fontSize: 5.sp,
                                                  color: isTahapPemesanan
                                                      ? AppConstants.WHITE
                                                      : AppConstants
                                                          .DARK_OLIVE_GREEN),
                                            ),
                                          ]));
                                    },
                                    valueNotifier: valueNotifier,
                                  )),
                            ),
                            Expanded(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Transform.scale(
                                    scale: widget.scale,
                                    scaleX: widget.scaleX,
                                    scaleY: widget.scaleY,
                                    alignment: widget.imgAlign,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: widget.imgAlign ==
                                                  Alignment.bottomRight
                                              ? const Radius.circular(13).r
                                              : Radius.zero),
                                      child: Image.asset(
                                        widget.img,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
