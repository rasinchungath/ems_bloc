import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: const Color(0XFF556080),
      padding: const EdgeInsets.all(0),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.arrow_back,
        color: kBGcolor,
        size: 30.0,
      ),
    );
  }
}
