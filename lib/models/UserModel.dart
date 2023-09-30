import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserModel {
  late String? id;
  late String username;
  late String email;
  late String password;

  late String address;
  late String avatar_image;
  late String avatar_image_link;
  late String? cMNDTruoc;
  late String? cMNDSau;
  late String? anhXe;
  late String phone;
  late String gender;

  late num? latitude;
  late num? longtitude;
  late String birthDay;
  late num? tichDiem;
  late num? money;

  late DateTime? ngayCapNhat;

  late String? thongTinThem;
  late String? trangThai;

  late LatLng? position;
  late bool? firstLogin;
  late bool? active = false;
  late bool? daSinh = false;
  late bool? verified = false;
  bool verifi;
  final int role;
  bool verification;
  String? token;

  UserModel(
      this.id,
      this.username,
      this.email,
      this.password,
      this.address,
      this.avatar_image,
      this.avatar_image_link,
      this.phone,
      this.verifi,
      this.role,
      this.gender,
      this.birthDay,
      this.verification,
      {this.token,
      this.cMNDSau,
      this.cMNDTruoc,
      this.anhXe,
      this.tichDiem,
      this.thongTinThem,
      this.latitude,
      this.longtitude,
      this.money,
      this.trangThai,
      this.ngayCapNhat,
      this.firstLogin,
      this.verified,
      this.position});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'] ?? "",
        email = json['email'],
        password = json['password'] ?? "",
        cMNDSau = json['cMNDSau'] ?? "",
        cMNDTruoc = json['cMNDTruoc'] ?? "",
        anhXe = json['anhXe'] ?? "",
        address = json['address'],
        avatar_image = json['avatar_image'],
        avatar_image_link = json['avatar_image_link'],
        phone = json['phone'],
        verifi = json['verifi'] ?? "",
        gender = json['gender'] ?? "",
        role = json['role'] ?? "",
        birthDay = json['birthDay'] ?? "",
        verification = json['verification'] ?? "",
        active = json['active'] ?? false,
        token = json['token'] ?? "",
        tichDiem = json['tichDiem'] ?? 0,
        latitude = json['latitude'] ?? 0,
        position = LatLng(
            json['latitude'] != null
                ? double.parse(json['latitude'].toString())
                : json['latitude'] ?? 0.0,
            json['longtitude'] != null
                ? double.parse(json['longtitude'].toString())
                : json['longtitude'] ?? 0.0),
        longtitude = json['longtitude'] ?? 0,
        thongTinThem = json['thongTinThem'],
        money = json['money'] ?? 0,
        ngayCapNhat =
            json['ngayCapNhat'] == null ? null : json['ngayCapNhat'].toDate(),
        trangThai = json['trangThai'] ?? "Chờ xác nhận",
        daSinh = json['daSinh'] ?? false,
        verified = json['verified'] ?? false,
        firstLogin = json['firstLogin'] ?? false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'address': address,
        'avatar_image': avatar_image,
        'password': password,
        'avatar_image_link': avatar_image_link,
        'phone': phone,
        'verifi': verifi,
        'cMNDSau': cMNDSau,
        'cMNDTruoc': cMNDTruoc,
        'anhXe': anhXe,
        'role': role,
        'birthDay': birthDay,
        'longtitude': longtitude ?? 0,
        'latitude': latitude ?? 0,
        'gender': gender,
        'verification': verification,
        'token': token ?? "",
        'tichDiem': tichDiem ?? 0,
        'thongTinThem': thongTinThem ?? "",
        'trangThai': trangThai ?? "",
        'money': money ?? 0,
        'ngayCapNhat': ngayCapNhat,
        'firstLogin': firstLogin,
        'active': active ?? false,
        'daSinh': daSinh ?? false,
        'verified': verified ?? false,
      };
  String userAsString() {
    return ' ${this.username}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => username;
}
