import 'package:flutter/material.dart';

class CircleProfileAvatar extends StatelessWidget {
  const CircleProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Color(0XFFDFEAF0),
          child: Text(
            'Add\nProfile\nPicture',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0.6,
              color: Color(0xFF929495),
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
