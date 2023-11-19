import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBack extends StatelessWidget {
   const CustomBack(
      {super.key,
      this.text = "",
      this.fontSize = 18,
      this.top = 0,
      this.bottom = 0,
      this.left = 0,
      this.right = 0,
      this.maxLines = 1,
      this.isIcon = true,
      this.color = AppColors.white,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w600,
      this.overflow = TextOverflow.ellipsis});

  final String text;
  final double fontSize;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final int maxLines;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isIcon == true
            ? IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: AppColors.white, size: 18),
        )
            : const SizedBox(),
        CustomText(
          text: text,
          fontSize: fontSize,
          color: color,
          textAlign: textAlign,
          fontWeight: fontWeight,
          top: top,
          bottom: bottom,
          overflow: overflow,
          maxLines: maxLines,
          left: left,
          right: right,
        ),
      ],
    );
  }
}
