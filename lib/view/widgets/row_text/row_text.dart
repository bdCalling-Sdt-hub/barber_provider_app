import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class RowText extends StatelessWidget {
  const RowText(
      {super.key,
      required this.field,
      required this.value,
      this.maxLine = 1,
      this.color = AppColors.white});

  final String field;
  final String value;
  final int maxLine;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: field, fontSize: 14, color: AppColors.paragraph),
        Flexible(
          child: CustomText(
            text: value,
            fontSize: 12.w,
            fontWeight: FontWeight.w500,
            left: 24,
            color: color,
            maxLines: maxLine,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
