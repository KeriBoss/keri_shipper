import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_palette.dart';

import 'phoneRessetController.dart';

class PhoneResetPage extends GetView<VerifiedPhoneRessetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Verification'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Center(
              child: Container(
                width: Get.width > 1000 ? Get.width / 2 : Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/undraw_Forgot_password_re_hxwm.png',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text(
                      "Xác thực số điện thoại",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Để xác thực tài khoản, chúng tôi sẽ gửi mã đến số điện thoại của bạn. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorPalette.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "+84",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          controller: controller.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Số điện thoại",
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ColorPalette.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            controller.verifiedPhone();
                          },
                          child: const Text(
                            "Gửi mã OTP ",
                            style: TextStyle(color: ColorConstants.whiteColor),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
