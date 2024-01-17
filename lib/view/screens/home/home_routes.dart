import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:barbar_provider/view/screens/home/screens/add_new_service.dart';
import 'package:barbar_provider/view/screens/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeRoutes extends StatelessWidget {
  const HomeRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const HomeScreen(), const AddNewService()];
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.provider.isNotEmpty ? screens[0] : screens[1];
    });
  }
}
