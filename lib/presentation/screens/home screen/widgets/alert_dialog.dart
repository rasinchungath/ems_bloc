import 'package:ems_bloc/presentation/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/colors/colors.dart';

showAlertDialog(
    {required BuildContext context, required VoidCallback onPressed}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          backgroundColor: kBGcolor,
          title:  Text(
            'Delete Employee',
            style: TextStyle(
              letterSpacing: 0.6,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Are you sure want to delete?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color(0XFF41485F),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onPressed,
              child: const Text('YES'),
            ),
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          ],
        );
      });
}
