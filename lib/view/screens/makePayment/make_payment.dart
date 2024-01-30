import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/makePayment/controller/make_payment_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/subsription_plan/subsription_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';

class MakePayment extends StatelessWidget {
  MakePayment({super.key});

  final MakePaymentController makePaymentController =
      Get.find<MakePaymentController>();

  @override
  Widget build(BuildContext context) {
    var packages = Get.arguments;

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
                  packageFeatures: packages.packageFeatures!,
                  color: AppColors.cardBgColor,
                  months: packages.packageDuration!,
                  price: packages.price.toString(),
                  buttonText: "Purchase Now",
                  title: packages.packageName!,
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
                          // final Customer customer = Customer(
                          //     name: "Md Jusef",
                          //     phoneNumber: "01317659523",
                          //     email: "mdjusef143@gmail.com");
                          // final Flutterwave flutterwave = Flutterwave(
                          //     context: context,
                          //     publicKey:
                          //         "FLWPUBK_TEST-db5cf091ec9599c4b3404f0fe4ea40b4-X",
                          //     currency: "NGN",
                          //     redirectUrl:
                          //         "https://ravemodal-dev.herokuapp.com/v3/hosted/pay/98ee71adad5aae5cb4c4",
                          //     txRef: "12345678",
                          //     amount: "200",
                          //     customer: customer,
                          //     paymentOptions: "card",
                          //     customization: Customization(title: "My Payment"),
                          //     isTestMode: true);

                          // final ChargeResponse response = await flutterwave.charge();

                          // print(
                          //     "Payment=============================${response.success}");

                          makePaymentController.generateGatewayLink(
                              ammount: packages.price.toString(),
                              packageID: packages.id);
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
