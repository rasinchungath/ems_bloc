import 'package:ems_bloc/presentation/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';

showAlertDialog(
    {required BuildContext context, required VoidCallback onPressed}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: kBGcolor,
          title: const Text(
            'Delete Employee',
            style: TextStyle(
              letterSpacing: 0.6,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Are you sure want to delete?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0XFF41485F),
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
