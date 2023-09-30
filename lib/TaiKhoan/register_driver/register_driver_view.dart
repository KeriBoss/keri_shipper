import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keri_shipper/constants/Themme.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/pages/pick_location/pick_location_view.dart';
import 'package:keri_shipper/validate/validate.dart';
import 'package:sizer/sizer.dart';
import 'register_driver_controller.dart';

class RegisterDriverPage extends GetView<RegisterDriverController> {
  RegisterDriverPage({Key? key}) : super(key: key);

  final logic = Get.put(RegisterDriverController());
  bool checkedValue = false;
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = false;
    Map _userObj = {};
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (Get.width > 1000)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
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
                          SizedBox(
                            height: 50,
                          ),
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
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                            child: TextFormField(
                                controller: logic.email,
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'Email tài khoản đăng nhập'),
                                validator: (val) =>
                                    validatorEmail(val.toString())
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
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                            child: TextFormField(
                                controller: logic.username,
                                decoration: const InputDecoration(
                                    labelText: 'Tên người dùng',
                                    hintText: 'Nhập tên của bạn'),
                                validator: (value) {
                                  return validatorText(value.toString());
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {},
                            child: TextFormField(
                              onTap: () async {
                                DateTime? _pickerDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2030));
                                if (_pickerDate != null) {
                                  logic.birthDay.text = DateFormat("dd/MM/yyyy")
                                      .format(_pickerDate);
                                }
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: "Chọn ngày sinh",
                                  labelText: "Ngày sinh"),
                              controller: logic.birthDay,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text('Giới tính')
                                  .textColor(Colors.grey)
                                  .fontSize(11)
                                  .fontWeight(FontWeight.w400),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Obx(
                                    () => ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: const Text("Nam"),
                                      leading: Radio(
                                          value: "Nam",
                                          groupValue: controller.gender.value,
                                          onChanged: (value) {
                                            controller.gender.value = "Nam";
                                          }),
                                    ),
                                  )),
                              Expanded(
                                flex: 4,
                                child: Obx(
                                  () => ListTile(
                                    title: const Text("Nữ"),
                                    leading: Radio(
                                        value: "Nữ",
                                        groupValue: controller.gender.value,
                                        onChanged: (value) {
                                          controller.gender.value = "Nữ";
                                        }),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Obx(
                                  () => ListTile(
                                    title: const Text("Khác"),
                                    leading: Radio(
                                        value: "Khác",
                                        groupValue: controller.gender.value,
                                        onChanged: (value) {
                                          controller.gender.value = "Khác";
                                        }),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
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
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                            child: TextFormField(
                              controller: logic.phoneNumber,
                              decoration: const InputDecoration(
                                  labelText: "Số điện thoại",
                                  hintText: "Nhập số điện thoại của bạn"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                return validatorPhone(val.toString());
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Obx(() => ImageButton(
                              controller.cmndMatTruoc, 'CCCD mặt trước')),
                          const SizedBox(height: 20.0),
                          Obx(() => ImageButton(
                              controller.cmndMatSau, 'CCCD mặt sau')),
                          const SizedBox(height: 20.0),
                          Obx(() => ImageButton(controller.anhXe, 'Ảnh xe')),
                          const SizedBox(height: 20.0),
                          Container(
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
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
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
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
                                if (logic.anhXe.isNotEmpty &&
                                    logic.cmndMatSau.isNotEmpty &&
                                    logic.cmndMatTruoc.isNotEmpty) {
                                  logic.SignUp(context);
                                } else {
                                  Get.defaultDialog(
                                      title: 'Thông báo ',
                                      content: const Text(
                                          'Vui lòng điền đủ thông tin. '));
                                }
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
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.close(1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecorator ImageButton(RxString path, title) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            2.h,
          ),
        ),
      ),
      child: InkWell(
        onTap: () => controller.pickImageFromLibrary(path),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: 100.w,
            child: path != ""
                ? Stack(
                    children: [
                      Container(
                        child: Image.file(
                          File(path.value),
                          fit: BoxFit.cover,
                          width: 100.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: IconButton(
                            color: Colors.white,
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              path.value = "";
                            },
                          ))
                    ],
                  )
                : FaIcon(FontAwesomeIcons.image),
          ),
        ),
      ),
    );
  }
}
