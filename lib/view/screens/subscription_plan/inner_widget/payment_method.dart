import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});


  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  int currentIndex = 0;

  List<dynamic> payment = [
    "Credit/Debit Card",
    "MTN Money",
    "Airtel Money"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: payment.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.cardBgColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 20,width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryLightOrange,width: 1,style: BorderStyle.solid),
                        color: currentIndex == index? AppColors.primaryOrange : AppColors.cardBgColor,
                      ),
                    ),
                    CustomText(text: payment[index],left: 12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16)
          ],
        );
      },
    );
  }
}
