import 'dart:math';

import 'package:intl/intl.dart';
import 'package:validators/validators.dart';

String? validatorEmail(String value) {
  if (value.isEmpty) {
    return "Vui lòng không để trống ";
  } else if (!isEmail(value)) {
    return "Vui lòng nhập email! ";
  }
  return null;
}

String? validatorPassword(String str, int minLength) {
  return str != null && isLength(str, minLength)
      ? null
      : "Vui lòng nhập nhiều hơn $minLength kí tự";
}

String? validatorPhone(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{9,10}$)';

  RegExp regExp = RegExp(patttern);
  if (!regExp.hasMatch(value)) return 'Vui lòng nhập số điện thoại';

  return null;
}

String? validatorConfirmPassword(String password, String repassword) {
  if (repassword.length < 6) {
    return "Vui lòng nhập nhiều hơn 6 kí tự";
  } else if (repassword != password) {
    return "Mật khẩu không trùng khớp!";
  }
  return null;
}

String? validatorText(String value) {
  if (value.isEmpty) {
    return "Vui lòng không để trống";
  }
  return null;
}

String? validatorURL(String value) {
  bool _validURL = Uri.parse(value).isAbsolute;
  if (value.isEmpty) {
    return "Vui lòng không để trống";
  }
  if (!_validURL) {
    return "Vui lòng nhập URL";
  }
  return null;
}

String? validatorTextLength(String value, int length) {
  if (value.isEmpty) {
    return "Vui lòng không để trống";
  }
  if (value.length < length) {
    return "Vui lòng nhập dài hơn $length kí tự";
  }

  return null;
}

String? validatorPasswordLength(String str, int minLength) {
  return str != null && isLength(str, minLength)
      ? null
      : "Vui lòng nhập nhiều hơn $minLength kí tự";
}

String? validatorLength(String str, int minLength) {
  print(str);
  return str != null && isLength(str, minLength)
      ? null
      : "Vui lòng nhập nhiều hơn $minLength kí tự";
}

String? validatorPhoneNumber(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{9,10}$)';

  RegExp regExp = RegExp(patttern);
  if (!regExp.hasMatch(value)) return 'Vui lòng nhập số điện thoại';

  return null;
}

String? validateVerifyPassword(String password, String repassword) {
  if (repassword.length < 6) {
    return "Vui lòng nhập nhiều hơn 6 kí tự";
  } else if (repassword != password) {
    return "Mật khẩu không trùng khớp!";
  }
  return null;
}

String? isNumeric(String string) {
  if (string.isEmpty) {
    return "Vui lòng không để trống";
  }
  try {
    var value = double.parse(string);
  } on FormatException {
    return "Vui lòng nhập số";
  }
  return null;
}

String? isNumericGiaSale(String string, String giaSale) {
  if (string.isEmpty) {
    return "Vui lòng không để trống";
  }
  try {
    var value = double.parse(string);
    var value2 = double.parse(giaSale);

    if (value < value2) {
      return null;
    } else {
      return "Vui lòng nhập giá sale nhỏ hơn giá bán";
    }
  } on FormatException {
    return "Vui lòng nhập số";
  }
  return null;
}

String? isNumericGiaBan(String string, String giaGiaBan) {
  if (string.isEmpty) {
    return "Vui lòng không để trống";
  }
  try {
    var value = double.parse(string);
    var value2 = double.parse(giaGiaBan);

    if (value < value2) {
      return null;
    } else {
      return "Vui lòng nhập giá bán lớn hơn giá gốc";
    }
  } on FormatException {
    return "Vui lòng nhập số";
  }
  return null;
}

String? isNumericThaiTuan(String string) {
  if (string.isEmpty) {
    return "Vui lòng không để trống";
  }
  try {
    var value = double.parse(string);
    if (value > 40) {
      return "Vui lòng chọn tuần đúng (<32)";
    }
  } on FormatException {
    return "Vui lòng nhập số";
  }
  return null;
}

String? validatorNamSinh(String birthDateString) {
  if (birthDateString.isEmpty) {
    return "Vui lòng không để trống";
  }

  try {
    String datePattern = "dd/MM/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
  } catch (e) {
    return "Vui lòng nhập đúng định dạng năm";
  }

  return null;
}
