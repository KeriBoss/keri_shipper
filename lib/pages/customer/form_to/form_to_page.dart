import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/constants/textstyle_ext.dart';
import 'package:keri_shipper/pages/customer/chon_xe/chon_xe_page.dart';
import 'package:keri_shipper/pages/picker_location/picker_location_page.dart';
import 'package:keri_shipper/widgets/loading.dart';

import 'package:sizer/sizer.dart';
import 'form_to_controller.dart';

class FormToPage extends StatelessWidget {
  var controller = Get.put(FormToController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.center.value == null
            ? Loading()
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: GestureDetector(
                                onTap: () {
                                  Get.close(1);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 25,
                                )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.diemDiController,
                                  decoration: InputDecoration(
                                      fillColor: const Color(0xffEAEAEA),
                                      filled: true,
                                      prefixIcon: const Icon(
                                        Icons.location_on_rounded,
                                        color: Color(0xff22587A),
                                      ),
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            Get.to(() => PickerLocationPage(
                                                  center:
                                                      controller.center.value!,
                                                  location:
                                                      (address, position) {
                                                    controller.diemDi.value =
                                                        address;
                                                    controller.diemDiController
                                                        .text = address;
                                                    controller.source =
                                                        position;
                                                  },
                                                ));
                                          },
                                          child: const Icon(
                                            Icons.map,
                                            color: ColorPalette.primaryColor,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          top: 14,
                                          right: 14,
                                          bottom: 14,
                                          left: 0)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  controller: controller.diemDenController,
                                  decoration: InputDecoration(
                                      fillColor: const Color(0xffEAEAEA),
                                      filled: true,
                                      prefixIcon: const Icon(
                                        Icons.location_on_rounded,
                                        color: Color(0xffEE6353),
                                      ),
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            Get.to(() => PickerLocationPage(
                                                  center:
                                                      controller.center.value!,
                                                  location:
                                                      (address, position) {
                                                    controller.diemDen.value =
                                                        address;
                                                    controller.destination =
                                                        position;
                                                    controller.diemDenController
                                                        .text = address;
                                                  },
                                                ));
                                          },
                                          child: const Icon(
                                            Icons.map,
                                            color: ColorPalette.primaryColor,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          top: 14,
                                          right: 14,
                                          bottom: 14,
                                          left: 0)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 10,
                      color: const Color(0xffEAEAEA),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.diemDen.value != 'Đến đâu?' &&
                            controller.diemDi.value != 'Vị trí hiện tại') {
                          Get.to(() => ChonXePage(),
                              arguments: controller.source);
                        } else {
                          Get.snackbar(
                              'Thông báo', 'Vui lòng chọn Điểm đến, điểm đi',
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        }
                      },
                      child: Container(
                        height: 54,
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                            color: ColorPalette.secondColor,
                            borderRadius: BorderRadius.circular(32)),
                        child: Center(
                            child: Text(
                          "Đặt xe",
                          style: TextStyles.defaultStyle.semiBold.whiteTextColor
                              .setTextSize(18),
                        )),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
