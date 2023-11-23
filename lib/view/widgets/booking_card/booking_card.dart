import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingCard extends StatelessWidget {
  const BookingCard(
      {super.key,
      required this.profileImage,
      required this.profileName,
      required this.value1,
      required this.value2,
      required this.value3,
      this.onTap,
      this.onPressedLeft,
      this.onPressedRight,
      required this.buttonLeft,
      required this.buttonRight});

  final String profileImage;
  final String profileName;
  final String value1;
  final String value2;
  final String value3;
  final String buttonLeft;
  final String buttonRight;
  final VoidCallback? onTap;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppColors.primaryOrange,
                width: 1,
                style: BorderStyle.solid),
            color: AppColors.cardBgColor),
        child: Column(
          children: [
            //Image and Name section
            Row(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(profileImage), fit: BoxFit.fill),
                  ),
                ),
                Flexible(
                  child: CustomText(
                      text: profileName,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      left: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),
            RowText(field: "Date:".tr, value: value1),
            const SizedBox(height: 12),
            RowText(field: "Services :".tr, value: value2, maxLine: 2),
            const SizedBox(height: 12),
            RowText(field: "Total Amount :".tr, value: "\$ $value3"),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        titleText: buttonLeft,
                        buttonHeight: 44,
                        onPressed: onPressedLeft)),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    onPressed: onPressedRight,
                    titleText: buttonRight,
                    buttonHeight: 44,
                    buttonColor: AppColors.cardBgColor,
                    borderColor: AppColors.primaryOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
