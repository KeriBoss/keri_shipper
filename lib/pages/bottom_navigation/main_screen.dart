import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/pages/chat_page/chat_page_view.dart';
import 'package:keri_shipper/pages/hoat_dong/hoat_dong_view.dart';
import 'package:keri_shipper/widgets/grab_bottom_navigation_item.dart';

import 'package:panara_dialogs/panara_dialogs.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _hideButtonController = ScrollController();
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HoatDongPage(),
    SafeArea(
      child: Text("Payment"),
    ),
    ChatScreen(),
    SafeArea(
      child: Text("Account"),
    ),
  ];

  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        PanaraConfirmDialog.show(
          context,
          title: "Thông báo",
          message: "Bạn có muốn thoát ?",
          cancelButtonText: "Không",
          noImage: true,
          confirmButtonText: "Có", onTapCancel: () => Get.close(1),
          onTapConfirm: () {
            Get.offAllNamed("login");
          },

          panaraDialogType: PanaraDialogType.warning,
          barrierDismissible: false, // optional parameter (default is true)
        );
        return Future(() => true);
      },
      child: Scaffold(
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 10),
          height:
              _isVisible ? MediaQuery.of(context).viewPadding.bottom + 70 : 0.0,
          child: BottomAppBar(
            elevation: 8,
            color: Colors.white,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: GrabBottomNavigationItem(
                      icon: FontAwesomeIcons.compass,
                      iconActive: FontAwesomeIcons.solidCompass,
                      title: "Trang chủ",
                      onTap: () {
                        _selectedIndex = 0;
                        setState(() {});
                      },
                      isActive: _selectedIndex == 0,
                    ),
                  ),
                  Expanded(
                    child: GrabBottomNavigationItem(
                      icon: FontAwesomeIcons.receipt,
                      title: "Hoạt động",
                      onTap: () {
                        _selectedIndex = 1;
                        setState(() {});
                      },
                      isActive: _selectedIndex == 1,
                    ),
                  ),
                  Expanded(
                    child: GrabBottomNavigationItem(
                      icon: FontAwesomeIcons.wallet,
                      title: "Thanh toán",
                      onTap: () {
                        _selectedIndex = 2;
                        setState(() {});
                      },
                      isActive: _selectedIndex == 2,
                    ),
                  ),
                  Expanded(
                    child: GrabBottomNavigationItem(
                      icon: FontAwesomeIcons.inbox,
                      title: "Tin nhắn",
                      onTap: () {
                        _selectedIndex = 3;
                        setState(() {});
                      },
                      isActive: _selectedIndex == 3,
                    ),
                  ),
                  GrabBottomNavigationItem(
                    icon: FontAwesomeIcons.userCircle,
                    iconActive: FontAwesomeIcons.solidUserCircle,
                    title: "Tài khoản",
                    onTap: () {
                      _selectedIndex = 4;
                      setState(() {});
                    },
                    isActive: _selectedIndex == 4,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          controller: _hideButtonController,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _widgetOptions.elementAt(_selectedIndex);
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
