import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'hoat_dong_controller.dart';

class HoatDongPage extends GetView<HoatDongController> {
  const HoatDongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Hoạt động').textColor(Colors.black).fontSize(25),
                      Card(
                        color: Color.fromARGB(255, 230, 236, 231),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.history,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              const Text('Lịch sử').fontSize(18),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    "assets/images/undraw_Tabs_re_a2bd.png",
                    width: Get.width * 0.7,
                  ),
                  Text('Hiện chưa có hoạt động nào')
                      .textColor(Colors.black)
                      .fontSize(20),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Hoạt động sẽ xuất hiện khi bạn sử dụng dịch vụ của chúng tôi')
                      .textColor(Colors.black)
                      .fontWeight(FontWeight.w300)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
