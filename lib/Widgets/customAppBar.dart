import 'package:get/get.dart';
import '../Utils/ccolors.dart';
import 'package:flutter/material.dart';
import '../View/Settings/View/Settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: CColors.yellowColor,
        centerTitle: true,
        actions:  [
          GestureDetector(
            onTap: () => Get.to(() => const SettingsScreen()),
            child: const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.settings, size: 32, color: CColors.blackColor),
            ),
          ),
        ],
        title: const Text("PRANKS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: CColors.blackColor,
              wordSpacing: 1,
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
