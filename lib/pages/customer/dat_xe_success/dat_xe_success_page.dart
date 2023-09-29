import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatXeSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin ')),
      body: Column(
        children: [
          Container(
            child: Text('DatXeSuccess Body'),
          ),
        ],
      ),
    );
  }
}