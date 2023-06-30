import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40, top: 20),
          child: SizedBox(
            width: 94,
            height: 44,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStateProperty.all(kbuttonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: onPressed,
              child: const Text(
                'Edit',
                style: TextStyle(
                  letterSpacing: 0.6,
                  color: Color(0XFFFFFFFF),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
