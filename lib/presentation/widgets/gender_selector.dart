import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key, required this.dropDown});
  final Widget dropDown;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Container(
        height: 30,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color(0XFFDFEAF0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            top: 5,
            bottom: 3,
          ),
          child: dropDown,
        ),
      ),
    );
  }
}
