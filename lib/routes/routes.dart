import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:keri_shipper/TaiKhoan/login/view.dart';
import 'package:keri_shipper/pages/bottom_navigation/home_screen.dart';
import 'package:keri_shipper/pages/bottom_navigation/main_screen.dart';
import 'package:keri_shipper/pages/splash/spashPage.dart';

class Routes {
  static const INITIAL = '/login';

  static final routes = [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/homeCustomer', page: () => MainScreen()),
    GetPage(name: '/splash', page: () => SplashPage()),
  ];
}
