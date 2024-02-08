import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/booking_request/controller/booking_reqcontroller.dart';
import 'package:barbar_provider/view/screens/booking_request/model/booking_req_model.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingReSchedule extends StatefulWidget {
  const BookingReSchedule({super.key});

  @override
  State<BookingReSchedule> createState() => _BookingReScheduleState();
}

class _BookingReScheduleState extends State<BookingReSchedule> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      
      });
    }
  }

  late int currentIndex = 0;

  List<String> timeList = [
    "9.30 AM",
    "10.00 AM",
    "11.00 AM",
    "12.00 AM",
    "01.00 PM",
    "02.00 PM",
    "03.00 PM",
    "04.00 PM",
    "05.00 PM",
    "06.00 PM",
    "07.00 PM",
    "08.00 PM",
  ];

  final Datum bookingReqList = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Re-Schedule Appointment".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Select Date".tr,
                  fontWeight: FontWeight.w600,
                  bottom: 16),

              //================================Choose Date=============================

              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.cardBgColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "${selectedDate.toLocal()}".split(' ')[0]),
                      const CustomImage(
                        imageSrc: AppIcons.bookings,
                        size: 24,
                        imageColor: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),

              //================================Time slot=============================

              CustomText(
                  text: "Available Slot ".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 36),
                itemCount: timeList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.primaryOrange
                          : AppColors.bgColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: currentIndex == index
                              ? Colors.transparent
                              : AppColors.stroke,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    child: Center(
                      child: CustomText(
                        text: timeList[index],
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            GetBuilder<BookingRequestController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child:

                //===================================Continue Button=============================

                controller.isLoading
                    ? const CustomLoader()
                    : CustomButton(
                        titleText: "Continue".tr,
                        onPressed: () async {
                          debugPrint(
                              "Date=========${selectedDate.year}-${selectedDate.month}-${selectedDate.day} Time-------- ${timeList[currentIndex]} ");

                          bool success = await controller.reSchedule(
                              id: bookingReqList.booking!.id.toString(),
                              date:
                                  "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                              time: timeList[currentIndex]);

                          if (success) {
                            Get.back();
                            Get.back();
                          }
                        }),
          );
        }),
      ),
    );
  }
}
