import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/pages/pick_location/pick_location_view.dart';

import 'package:keri_shipper/validate/validate.dart';

import '../../../constants/Header_widget.dart';
import '../../../constants/Themme.dart';

import 'logic.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({Key? key}) : super(key: key);

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  final logic = Get.put(RegisterLogic());
  bool checkedValue = false;
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = false;
    Map _userObj = {};
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tạo tài khoản'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (Get.width > 1000)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/undraw_Sign_up_n6im.png",
                      height: Get.height / 2,
                      width: Get.width / 4,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Chúng tôi luôn tìm cách tạo ra và mang lại giá trị cho bạn.  ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Đăng ký ngay với chúng tôi để nhận nhiều ưu đãi độc quyền !  ',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              Container(
                width: Get.width > 1000 ? Get.width / 3 : Get.width - 50,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Form(
                  key: logic.keys,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          color: ColorPalette.primaryColor,
                          size: 80.0,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                            controller: logic.email,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'Email tài khoản đăng nhập'),
                            validator: (val) => validatorEmail(val.toString())
                            // if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                            //   return "Enter a valid email address";
                            // }
                            // return null;

                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                            controller: logic.username,
                            decoration: const InputDecoration(
                                labelText: 'Tên người dùng',
                                hintText: 'Nhập tên của bạn'),
                            validator: (value) {
                              return validatorText(value.toString());
                            }),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                            controller: logic.address,
                            maxLines: 2,
                            decoration: InputDecoration(
                                labelText: "Địa chỉ",
                                hintText: "Nhập địa chỉ của bạn",
                                suffixIcon: InkWell(
                                    child: Icon(Icons.map),
                                    onTap: () {
                                      Get.to(PickLocationPage(
                                        initPosition: null,
                                        f: (address, positioned) =>
                                            logic.address.text = address,
                                      ));
                                    })),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return validatorText(value.toString());
                            }),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: logic.phoneNumber,
                          decoration: const InputDecoration(
                              labelText: "Số điện thoại(không bắt buộc)",
                              hintText: "Nhập số điện thoại của bạn"),
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (logic.phoneNumber.text.isNotEmpty) {
                              return validatorPhone(val.toString());
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: logic.password,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Mật khẩu ",
                              hintText: "Nhập mật khẩu của bạn"),
                          validator: (val) {
                            return validatorPassword(val.toString(), 6);
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: logic.cfPassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Nhập lại mật khẩu ",
                              hintText: "Nhập lại mật khẩu của bạn"),
                          validator: (val) {
                            return validatorConfirmPassword(
                                logic.password.text, val.toString());
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        child: Text(
                          "Đăng ký".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (logic.keys.currentState!.validate()) {
                            logic.SignUp(context);
                          }
                        },
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        //child: Text('Don\'t have an account? Create'),
                        child: Text.rich(TextSpan(children: [
                          const TextSpan(text: "Bạn đã có tài khoản "),
                          TextSpan(
                            text: ' Đăng nhập',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back();
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.primaryColor),
                          ),
                        ])),
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
