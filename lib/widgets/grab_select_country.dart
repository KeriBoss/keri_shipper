import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';

class GrabSelectCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[100],
      ),
      child: CountryCodePicker(
        initialSelection: 'ID',
        showCountryOnly: true,
        alignLeft: false,
      ),
    );
  }
}
