import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/TaiKhoan/forgotPass/forGotPassController.dart';
import 'package:keri_shipper/TaiKhoan/register/view.dart';
import 'package:keri_shipper/TaiKhoan/register_driver/register_driver_view.dart';
import 'package:keri_shipper/constants/Header_widget.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/validate/validate.dart';

import '../../../constants/Themme.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  final double _headerHeight = 200;
  final logic = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (Get.width > 1000)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/undraw_enter_uhqk.png",
                        height: Get.height / 2,
                        width: Get.width / 4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        ' TIẾT KIỆM THỜI GIAN. CẢM THẤY TỐT HƠN. ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '  UY TÍN - CHẤT LƯỢNG - GIÁ TỐT.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        ' Đến ngay với chúng tôi để nhận nhiều ưu đãi độc quyền !',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    width: Get.width > 1000 ? Get.width / 4 : Get.width - 20,

                    // This will be the login form
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: Get.width > 1000
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: _headerHeight,
                              child: HeaderWidget(
                                  _headerHeight,
                                  true,
                                  Icons
                                      .login_rounded), //let's create a common header widget
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Vinaship ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                                .fontSize(22)
                                .textColor(ColorConstants.primaryColor),
                            const SizedBox(height: 30.0),
                            Form(
                                key: logic.key,
                                child: Column(
                                  children: [
                                    Container(
                                      child: TextFormField(
                                        controller: logic.email,
                                        validator: (v) {
                                          return validatorEmail(v.toString());
                                        },
                                        decoration: InputDecoration(
                                            labelText: "Tên đăng nhập",
                                            hintText: "Email đăng nhập"),
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Container(
                                      child: Obx(() => TextFormField(
                                            controller: logic.password,
                                            validator: (v) {
                                              return validatorPassword(
                                                  v.toString(), 6);
                                            },
                                            obscureText: logic.isHide.value,
                                            decoration: InputDecoration(
                                                labelText: "Mật khẩu",
                                                hintText: "Nhập mật khẩu",
                                                suffixIcon: IconButton(
                                                  icon: !logic.isHide.value
                                                      ? const Icon(
                                                          Icons.remove_red_eye,
                                                          color: Colors.grey,
                                                        )
                                                      : const Icon(
                                                          Icons.visibility_off,
                                                          color: Colors.grey,
                                                        ),
                                                  onPressed: () {
                                                    logic.isHide.value =
                                                        !logic.isHide.value;
                                                  },
                                                )),
                                          )),
                                    ),
                                    const SizedBox(height: 15.0),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 20),
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(ForGotPassScreen());
                                        },
                                        child: const Text(
                                          "Quên mật khẩu?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorConstants.fourColor),
                                        child: Text(
                                          'Đăng nhập',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          if (logic.key.currentState!
                                              .validate()) {
                                            logic.Login(context);
                                          }
                                          //After successful login we will redirect to profile page. Let's create profile page now
                                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5,
                                          left: 10,
                                          right: 10,
                                          top: 10),
                                      //child: Text('Don\'t have an account? Create'),
                                      child: Text.rich(TextSpan(children: [
                                        const TextSpan(
                                            text: "Bạn chưa có tài khoản",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                        TextSpan(
                                          text: ' Đăng ký',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.to(() => ResgisterPage());
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                            },
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color:
                                                  ColorConstants.primaryColor),
                                        ),
                                      ])),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5,
                                          left: 10,
                                          right: 10,
                                          top: 10),
                                      //child: Text('Don\'t have an account? Create'),
                                      child: Text.rich(TextSpan(children: [
                                        const TextSpan(
                                            text: "Bạn muốn đăng ký tài xế ",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                        TextSpan(
                                          text: ' Đăng ký',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.to(
                                                  () => RegisterDriverPage());
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                            },
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color:
                                                  ColorConstants.primaryColor),
                                        ),
                                      ])),
                                    ),
                                  ],
                                )),
                          ],
                        )),
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
