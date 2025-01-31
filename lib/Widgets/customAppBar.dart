import 'package:get/get.dart';
import '../Utils/ccolors.dart';
import 'package:flutter/material.dart';
import '../View/Settings/View/Settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: CColors.yellowColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Image.asset(
            "assets/images/backarrow.png",
            height: 24,
            width: 24,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const SettingsScreen()),
            child:  Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset(
                "assets/images/settings.png",
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
        title: Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: CColors.blackColor,
              wordSpacing: 1,
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
