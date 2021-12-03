import 'package:flutter/cupertino.dart';

double getScreenWidth(BuildContext context) {
  // 기기마다 위젯크기 조정.
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}
