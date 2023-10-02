import 'package:fi/common/color_sheme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  const PrimaryButton(
      {super.key,
      required this.title,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: FColor.gray70),
            color: FColor.gray80),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: FColor.white, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
