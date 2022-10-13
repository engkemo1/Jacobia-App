import 'package:flutter/material.dart';
import '../../view_model/database/local/cache_helper.dart';

// const Color primaryColor = Color(0xff07919C);
const Color primaryColor = Color(0xff008AFF);
const Color secondaryColor = Color(0xff00C9FF);
const textColorDrawer = Colors.white;
const iconColorDrawer = Colors.white;
const shadowColor = Color.fromRGBO(143, 148, 251, .2);

String? userToken = CacheHelper.get(key: "accessToken");
String? userRefreshToken = CacheHelper.get(key: "refreshToken");
String? userType = CacheHelper.get(key: "userType");
String? userView = CacheHelper.get(key: "userView");
String? role = CacheHelper.get(key: "role");

LinearGradient gradientColor({required Color one, required Color two}) {
  return LinearGradient(
    colors: [one, two],
  );
}

const gray = Color(0xff008AFF);
const grayTwo = Color(0xff53FBDD);
const grayText = Color(0xff00C9FF);

bool connected = true;

const kColor = Color(0xff53FBDD);
const double kDefaultPadding = 20.0;

  const newVv = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [gray, grayTwo, grayText],
);

const mainGradient = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [Color(0xffFF6600), Color(0xffFF9752), Color(0xffFFC9A5)],
);
String? validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  }
  else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null ;}
String? validatePassword(String value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
}
String? validateName(String value) {
  if (value.length < 3)
    return 'Name must be more than 2 charater';
  else
    return null;
}

