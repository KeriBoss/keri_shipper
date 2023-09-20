import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';

List<Map<String, dynamic>> optionSettingAdmin = [
  {
    'icon': Icons.person,
    'title': "Thông tin tài khoản",
    'screenLink': "/profileAdminPage",
  },
  {
    'icon': Icons.password,
    'title': "Đổi mật khẩu",
    'screenLink': "/resetPasswordPage",
  },
  {
    'icon': Icons.logout,
    'title': "Đăng xuất",
    'screenLink': "/logout",
  },
];

///
String stk = "0868 700 900";
String hotline = "0868 700 900";
String tenChuTaiKhoan = "PHAM DANG KHOA";
String tenNganHang = "MB Bank";
List<Map<String, dynamic>> optionSettingHospital = [
  {
    'icon': Icons.password,
    'title': "Đổi mật khẩu",
    'screenLink': "/resetPasswordPage",
  },
  {
    'icon': Icons.logout,
    'title': "Đăng xuất",
    'screenLink': "/logout",
  },
];
List<Map<String, dynamic>> optionSettingDoctor = [
  {
    'icon': Icons.person,
    'title': "Thông tin tài khoản",
    'screenLink': "/profileAdminPage",
  },
  {
    'icon': Icons.password,
    'title': "Đổi mật khẩu",
    'screenLink': "/resetPasswordPage",
  },
  {
    'icon': Icons.logout,
    'title': "Đăng xuất",
    'screenLink': "/logout",
  },
];
List<Map<String, dynamic>> optionSettingCustomer = [
  {
    'icon': Icons.person,
    'title': "Thông tin tài khoản",
    'screenLink': "/profileKHPage",
  },
  {
    'icon': Icons.history,
    'title': "Lịch sử đặt hàng",
    'screenLink': "/lichsudathangPage",
  },
  {
    'icon': Icons.password,
    'title': "Đổi mật khẩu",
    'screenLink': "/resetPasswordPage",
  },
  {
    'icon': Icons.logout,
    'title': "Đăng xuất",
    'screenLink': "/logout",
  },
];
String GetEmoji(String trangThai) {
  switch (trangThai) {
    case "Vui":
      return "😄";
    case "Buồn":
      return "🙁";
    case "Lo Lắng":
      return "😦";
    default:
      return "";
  }
}

List<Map<String, dynamic>> optionSettingCH = [
  {
    'icon': Icons.password,
    'title': "Đổi mật khẩu",
    'screenLink': "/resetPasswordPage",
  },
  {
    'icon': Icons.pie_chart_outline,
    'title': "Thống kê",
    'screenLink': "/thongkePage",
  },
  {
    'icon': Icons.logout,
    'title': "Đăng xuất",
    'screenLink': "/logout",
  },
];
final oCcy = NumberFormat("#,##0", "en_US");
DateFormat dateFormat = DateFormat('dd-MM-yyyy');
DateFormat onlydateFormat = DateFormat('dd-MM');
DateFormat dateFormatSS = DateFormat(' HH:mm dd-MM-yyyy');

class MyCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'vừa xong';
  @override
  String aboutAMinute(int minutes) => '${minutes} phút trước';
  @override
  String minutes(int minutes) => '${minutes} phút trước';
  @override
  String aboutAnHour(int minutes) => '${(minutes ~/ 60)} giờ trước';
  @override
  String hours(int hours) => '${hours} giờ trước';
  @override
  String aDay(int hours) => 'gần ${(hours / 24).ceil()} ngày trước ';
  @override
  String days(int days) => '${days} ngày trước';
  @override
  String aboutAMonth(int days) => '${(days ~/ 30)} tháng trước';
  @override
  String months(int months) => '${months} tháng trước';
  @override
  String aboutAYear(int year) => '${year} năm trước';
  @override
  String years(int years) => '${years} năm trước';
  @override
  String wordSeparator() => ' ';
}
