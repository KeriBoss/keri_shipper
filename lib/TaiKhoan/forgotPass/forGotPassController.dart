import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/constants/font_constants.dart';
import 'package:keri_shipper/validate/validate.dart';

import 'forGotPassController_controller.dart';

class ForGotPassScreen extends StatelessWidget {
  ForGotPassScreen({Key? key}) : super(key: key);
  final ForGotPassController _signUpController =
      Get.put(ForGotPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quên mật khẩu')),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: Get.width > 1000 ? Get.width / 2 : Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                    child: Text(
                      'Hãy nhập Email của bạn , chúng tôi sẽ link khôi phục mật khẩu đến tài khoản của bạn ? ',
                      style: Theme.of(context).textTheme.headline5,
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Form(
                  key: _signUpController.formKey,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.5.w),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _signUpController.emailController,
                            decoration:
                                const InputDecoration(label: Text('Email')),
                            validator: (item) => validatorEmail(
                                _signUpController.emailController.text)),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_signUpController.formKey.currentState!
                                  .validate()) {
                                _signUpController.forgotPassword();
                              }
                            },
                            child: const Text(
                              'Gửi ',
                              style:
                                  TextStyle(color: ColorConstants.whiteColor),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2.h,
                            bottom: 3.h,
                          ),
                          child: Text(
                            'Hoặc',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Khôi phục mật khẩu bằng',
                              style: TextStyle(
                                  fontFamily: FontConstants.comfortaaBold,
                                  fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed("/phoneResetPage"),
                              child: const Text(
                                ' số điện thoại .',
                                style: TextStyle(
                                    color: ColorPalette.primaryColor,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            ' Đăng Nhập ',
                            style: TextStyle(
                                color: ColorPalette.primaryColor, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
