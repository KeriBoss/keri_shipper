import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/validate/validate.dart';

import 'UpdatePasswordController.dart';

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordController changePasswordController =
      Get.put(UpdatePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đổi mật khẩu'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/pngs/changepass.png"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Thay đổi mật khẩu ?",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vui lòng nhập thông tin tài khoản và mật khẩu để đổi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(() => changePasswordController.currentUser.value != null
                    ? Form(
                        key: changePasswordController.formKey,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                enabled: false,
                                controller:
                                    changePasswordController.emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "E-mail",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: changePasswordController
                                    .passwordNewController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Mật khẩu mới",
                                ),
                                obscureText: true,
                                validator: (value) => validatorPasswordLength(
                                    changePasswordController
                                        .passwordNewController.text,
                                    6),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: changePasswordController
                                    .confirmPasswordController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Nhập lại mật khẩu",
                                ),
                                validator: (value) => validateVerifyPassword(
                                    changePasswordController
                                        .passwordNewController.text,
                                    changePasswordController
                                        .confirmPasswordController.text),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (changePasswordController
                                        .formKey.currentState!
                                        .validate()) {
                                      changePasswordController.ChangePassword(
                                          context);
                                    }
                                  },
                                  child: const Text(
                                    'Đổi mật khẩu',
                                    style: TextStyle(
                                        color: ColorConstants.whiteColor),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container())
              ],
            )
          ],
        ),
      ),
    );
  }
}
