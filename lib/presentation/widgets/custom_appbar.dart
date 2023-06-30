import 'package:flutter/material.dart';
import '../../core/constants/constant.dart';

AppBar customAppbar({required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 70,
    flexibleSpace: Container(
      height: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Top Header2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: kAppBarTextstyle,
        ),
      ),
    ),
  );
}
