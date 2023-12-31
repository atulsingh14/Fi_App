import 'package:fi/common/color_sheme.dart';
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign titleAlign;
  final bool obscureText;
  const RoundTextField(
      {super.key,
      required this.title,
      this.titleAlign = TextAlign.left,
      this.controller,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: titleAlign,
                style: TextStyle(color: TColor.gray10, fontSize: 14),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 52,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: TColor.gray,
              border: Border.all(color: TColor.border),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              keyboardType: keyboardType,
              obscureText: obscureText,
              style: TextStyle(color: TColor.gray10),
            ),
          ),
        )
      ],
    );
  }
}
