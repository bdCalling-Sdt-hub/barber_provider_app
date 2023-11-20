import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard(
      {super.key,
      required this.imageSrc,
      required this.text,
        this.colorTrue = false,
      required this.imageType});

  final String imageSrc;
  final String text;
  final ImageType imageType;
  final bool colorTrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: colorTrue == true ?  AppColors.primaryOrange : AppColors.cardBgColor),
      child: Row(
        children: [
          CustomImage(
            imageSrc: imageSrc,
            imageType: imageType,
            size: 24,
          ),
          CustomText(text: text, fontSize: 14, fontWeight: FontWeight.w400, left: 16)
        ],
      ),
    );
  }
}
