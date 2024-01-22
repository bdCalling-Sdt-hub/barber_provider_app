import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTime extends StatelessWidget {
  final Function(TimeOfDay)? onTimeSelected;
  final TimeOfDay? initialTime;

  const SelectTime({Key? key, this.onTimeSelected, this.initialTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: initialTime ?? TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: false,
              ),
              child: child!,
            );
          },
        );

        if (time != null && onTimeSelected != null) {
          onTimeSelected!(time);
          String period = time.period == DayPeriod.am ? 'AM' : 'PM';
          debugPrint(
              "Selected Time: ${time.hourOfPeriod}:${time.minute} $period");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.cardBgColor), // Change color as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.watch_later_outlined,
                size: 16, color: Colors.white),

            CustomText(
              fontSize: 12.w,
              left: 8.w,
              text: initialTime != null
                  ? "${initialTime!.hour}:${initialTime!.minute}"
                  : "Select Time",
            )
            // Text(
            //   initialTime != null
            //       ? "${initialTime!.hour}:${initialTime!.minute}"
            //       : "Select Time",
            //   style: TextStyle(fontSize: 12, color: Colors.white),
            // )
          ],
        ),
      ),
    );
  }
}
