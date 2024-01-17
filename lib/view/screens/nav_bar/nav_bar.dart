import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/bookings/bookings_screen.dart';
import 'package:barbar_provider/view/screens/earnings/earnings_screen.dart';
import 'package:barbar_provider/view/screens/home/home_routes.dart';
import 'package:barbar_provider/view/screens/profile/profile_screen.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  static List<Widget> screens = <Widget>[
    const HomeRoutes(),
    const EarningsScreen(),
    const BookingsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> manuBarItems = [
      MenuBarItems(
          text: "Home".tr,
          index: 0,
          selectedIndex: selectedIndex,
          image: selectedIndex == 0 ? AppIcons.home : AppIcons.home),
      MenuBarItems(
        text: "Earnings".tr,
        index: 1,
        selectedIndex: selectedIndex,
        image: selectedIndex == 1 ? AppIcons.earnings : AppIcons.earnings,
      ),
      MenuBarItems(
        text: "Bookings".tr,
        index: 2,
        selectedIndex: selectedIndex,
        image: selectedIndex == 2 ? AppIcons.bookings : AppIcons.bookings,
      ),
      MenuBarItems(
        text: "Profile".tr,
        index: 3,
        selectedIndex: selectedIndex,
        image: selectedIndex == 3 ? AppIcons.profile : AppIcons.profile,
      ),
    ];

    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.bgColor,
        body: screens[selectedIndex],
        bottomNavigationBar: Container(
          color: AppColors.cardBgColor,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(manuBarItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: manuBarItems[index],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class MenuBarItems extends StatelessWidget {
  const MenuBarItems(
      {super.key,
      required this.image,
      required this.index,
      required this.selectedIndex,
      required this.text});

  final String image;
  final String text;

  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: index != selectedIndex
                  ? Colors.transparent
                  : AppColors.stroke,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              CustomImage(
                  size: 24,
                  imageColor: index != selectedIndex
                      ? AppColors.paragraph
                      : AppColors.primaryOrange,
                  imageSrc: image),
              if (index == selectedIndex)
                CustomText(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    text: text,
                    left: 4,
                    color: AppColors.primaryOrange),
            ],
          ),
        ),
      ],
    );
  }
}
