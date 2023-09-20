import 'dart:convert';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class GetNganhName extends StatelessWidget {
  final String idNganh;
  TextStyle? style;
  GetNganhName(this.idNganh, {this.style});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('nganh');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(idNganh).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            data['tenNganh'],
            style: style ?? Theme.of(context).textTheme.headline6,
          );
        }

        return Text("....");
      },
    );
  }
}

class GetNhomName extends StatelessWidget {
  final String idNhom;

  GetNhomName(this.idNhom);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('category');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(idNhom).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            data['ten'],
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
          );
        }

        return Text("....");
      },
    );
  }
}

class GetDanhMucName extends StatelessWidget {
  final String idDanhMuc;

  GetDanhMucName(this.idDanhMuc);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('category');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(idDanhMuc).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            data['ten'],
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 15, fontWeight: FontWeight.normal),
          );
        }

        return Text("....");
      },
    );
  }
}

class GetCuaHangName extends StatelessWidget {
  final String idCH;
  final TextStyle? style;
  GetCuaHangName(this.idCH, {this.style});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('cuaHang');
    try {
      return FutureBuilder<DocumentSnapshot>(
        future: users.doc(idCH).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.isBlank!) {
            return Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "tan_thinh_phone",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }

          if (snapshot.hasError) {
            return Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "tan_thinh_phone",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Tân Thịnh PĐK",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.store),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    data['tenCuaHang'],
                    style: style == null
                        ? Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 18, fontWeight: FontWeight.bold)
                        : style,
                  ),
                  onTap: () => Get.toNamed("/thongTinCuaHangCusPage",
                      arguments: data['id']),
                ),
              ],
            );
          }

          return Text("....");
        },
      );
    } catch (e) {
      return Row(
        children: [
          Icon(Icons.store),
          SizedBox(
            width: 10,
          ),
          Text(
            "tan_thinh_phone",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }
}

class GetUserName extends StatelessWidget {
  final String id;
  TextStyle? style;
  GetUserName(this.id, {this.style});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data['role']);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                data['username'],
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        }

        return Text("....");
      },
    );
  }
}

class GetAdrresPhoneUser extends StatelessWidget {
  final String id;
  TextStyle? style;
  GetAdrresPhoneUser(this.id, {this.style});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                data['address'],
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data['phone'],
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data['email'],
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        }

        return Text("....");
      },
    );
  }
}

class GetAvatar extends StatelessWidget {
  final String id;
  TextStyle? style;
  GetAvatar(this.id);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              data['avatar_image_link'].toString().isNotEmpty
                  ? SizedBox(
                      width: 40,
                      child: CachedNetworkImage(
                        imageUrl: data['avatar_image_link'],
                        width: 40,
                        height: 40,
                      ),
                    )
                  : Icon(Icons.person),
            ],
          );
        }

        return Text("....");
      },
    );
  }
}
