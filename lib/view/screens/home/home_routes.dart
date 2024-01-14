import 'package:barbar_provider/view/screens/home/screens/add_new_service.dart';
import 'package:barbar_provider/view/screens/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeRoutes extends StatelessWidget {
  const HomeRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const HomeScreen(), const AddNewService()];
    return screens[1];
  }
}
