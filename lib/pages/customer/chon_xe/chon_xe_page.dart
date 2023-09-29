import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/constants/textstyle_ext.dart';
import 'package:keri_shipper/models/driver.dart';
import 'package:keri_shipper/pages/customer/chon_xe/component/google_screen.dart';

import 'package:sizer/sizer.dart';
import 'chon_xe_controller.dart';

class ChonXePage extends StatelessWidget {

  var controller = Get.put(ChonXeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const GoogleScreen(),
            Obx(() {
              return Visibility(
                visible: controller.isVisibilityChooseCar.value,
                child: chooseCar(),
              );
            }),
            Obx(() {
              return Visibility(
                visible: controller.isFindDriver.value,
                child: waitDriver(),
              );
            }),
            Positioned(
              top: 10,
              left: 15,
              child: IconButton(
                icon: const Icon(Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Get.close(1);
                },

              ),
            )
          ],
        ),
      ),
    );
  }

  Widget waitDriver() {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 20,
      child: Container(
        width: 100.w,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 5),
                  blurRadius: 2,
                  spreadRadius: 2
              )
            ]
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/feature/grab_bike.png', width: 50, height: 50,),
            const SizedBox(width: 15,),
            // Obx(() {
            //   return controller.isFind.value == false ?
            //   Text("Đang tìm xe", style: TextStyles.defaultStyle.medium.setTextSize(24),) :
            //   Text("Đang kết nối bạn với tài xế", style: TextStyles.defaultStyle.medium.setTextSize(22),)
            //   ;
            // }),
            Text("Đang kết nối bạn với tài xế...",
              style: TextStyles.defaultStyle.medium.setTextSize(20),)
          ],
        ),
      ),
    );
  }

  Widget chooseCar() {
    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.8),
                    offset: const Offset(3, 2),
                    blurRadius: 7)
              ]
          ),
          child: ListView(
            controller: scrollController,
            children: [
              const Icon(Icons.remove, size: 50, color: Colors.grey,),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listDriver.length,
                  itemBuilder: (context, index) {
                    Driver data = controller.listDriver[index];
                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                      child: itemXe(data.typeRider, index),
                    );
                  },
                );
              }),
              GestureDetector(
                onTap: () {
                  // Get.to(() => RiderPage(), arguments: controller.selectedCar);
                  controller.isVisibilityChooseCar.value = false;
                  controller.isFindDriver.value = true;
                },
                child: Container(
                  height: 54,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                      color: ColorPalette.secondColor,
                      borderRadius: BorderRadius.circular(32)
                  ),
                  child: Center(child: Text("Đặt xe",
                    style: TextStyles.defaultStyle.semiBold.whiteTextColor
                        .setTextSize(18),)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget itemXe(String typeCar, int index) {
    return Column(
      children: [
        Obx(() {
          return Container(
            color: controller.selectedIndex.value == index ?
            const Color(0xff006491).withOpacity(0.2) :
            Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        typeCar == 'bike' ? Image.asset(
                          'assets/images/feature/grab_bike.png',
                          width: 50,
                          height: 50,
                        ) : Image.asset('assets/images/feature/grab_car.png',
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(typeCar == 'bike' ? "GrabBike" : "GrabCar",
                              style: TextStyles.defaultStyle.semiBold
                                  .setTextSize(18),),
                            const SizedBox(height: 5,),
                            Text(typeCar == 'bike'
                                ? "Xe tay ga"
                                : "Tối đa 4 hành khách", style: TextStyles
                                .defaultStyle.greyTextColor.medium.setTextSize(
                                14)),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("110.000đ",
                          style: TextStyles.defaultStyle.semiBold.setTextSize(
                              18),),
                        const SizedBox(height: 5,),
                        Text("6 - 11 phút",
                          style: TextStyles.defaultStyle.greyTextColor.medium
                              .setTextSize(14),),
                      ],
                    )
                  ],
                ),

              ],
            ),
          );
        }),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 2,
          color: const Color(0xffEAEAEA),
        )
      ],
    );
  }

}


