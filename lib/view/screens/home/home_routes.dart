import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:barbar_provider/view/screens/home/screens/add_new_service.dart';
import 'package:barbar_provider/view/screens/home/screens/home_screen.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeRoutes extends StatelessWidget {
  const HomeRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    //===================Screens to navigate from==============

    List<Widget> screens = [const HomeScreen(), const AddNewService()];

    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.routeLoading) {
        return const CustomLoader();
      }
      return controller.provider.isNotEmpty ? screens[0] : screens[1];
    });
  }
}


