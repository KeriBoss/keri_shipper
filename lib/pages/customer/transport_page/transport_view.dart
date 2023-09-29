import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/constants/constant.dart';
import 'package:keri_shipper/constants/textstyle_ext.dart';
import 'package:keri_shipper/pages/customer/form_to/form_to_page.dart';

import 'package:sizer/sizer.dart';

import 'transport_controller.dart';

class TransportPage extends StatelessWidget {
  final controller = Get.put(TransportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            locationOld(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      height: 30.h,
      decoration: const BoxDecoration(
          //color: Color(0xffB6EDC0),
          ),
      child: Stack(
        children: [
          Container(
            color: const Color(0xffB6EDC0),
            height: 30.h - 30,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 36 + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.close(1);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Vận chuyển ",
                          style: kGrabBlackRegularMedium.copyWith(fontSize: 25),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            color: const Color(0xffCFF4D3),
                            borderRadius: BorderRadius.circular(36)),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.map_outlined,
                              size: 25,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Bản đồ",
                              style: kGrabBlackRegularMedium,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Dù bạn đang đi đâu, hãy\nđưa bạn đến đó!",
                    style: kGrabBlackRegularSmall.copyWith(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Get.to(() => FormToPage());
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 50,
                          spreadRadius: 5,
                          offset: const Offset(0, 10)),
                    ]),
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Color(0xffEE6353),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Đến đâu?",
                      style: kGrabBlackRegularMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget locationOld() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      itemBuilder: (context, index) {
        return itemLocation();
      },
    );
  }

  Widget itemLocation() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 17,
                    backgroundColor: Color(0xff00B250),
                    child: Icon(
                      Icons.location_on,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vincom Center Đồng khởi',
                          style: TextStyles.defaultStyle.semiBold),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '72 Lê Thánh Tôn, P.Bến, Q.1, Hồ...',
                        style: TextStyles.defaultStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              size: 25,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
