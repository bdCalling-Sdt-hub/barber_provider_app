import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/makePayment/controller/make_payment_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/subsription_plan/subsription_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({super.key});

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  final MakePaymentController makePaymentController =
      Get.find<MakePaymentController>();

  var packages = Get.arguments;

  @override
  void initState() {
    makePaymentController.package = packages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar:
            CustomAppBar(appBarContent: CustomBack(text: "Make payment".tr)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //======================================Package Design=============================

                SubscriptionPlanCard(
                  showButton: false,
                  packageFeatures:
                      makePaymentController.package.packageFeatures!,
                  color: AppColors.cardBgColor,
                  months: makePaymentController.package.packageDuration!,
                  price: makePaymentController.package.price.toString(),
                  buttonText: "Purchase Now",
                  title: makePaymentController.package.packageName!,
                ),
                // CustomText(
                //     text: "Choose your payment method".tr, top: 44, bottom: 16),

                //======================================Payment Method=============================

                // const PaymentMethod(),
                // const SizedBox(height: 24),
                makePaymentController.isloading.value
                    ? const CustomLoader()
                    : CustomButton(
                        titleText: "Proceed to Payment".tr,
                        onPressed: () async {
                          makePaymentController.generateGatewayLink(
                              ammount: makePaymentController.package.price
                                  .toString(),
                              packageID: makePaymentController.package.id);
                        },
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
