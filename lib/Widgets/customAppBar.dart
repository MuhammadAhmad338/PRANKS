import 'package:get/get.dart';
import '../Utils/ccolors.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/const.dart';
import '../View/Settings/View/Settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: CColors.yellowGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                backUrl,
                height: 30,
                width: 30,
              ),
            )),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const SettingsScreen()),
            child: Padding(
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
              shadows: [
                                  Shadow(
                                    color: CColors.blackColor,
                                    offset: Offset(0, 2),
                                    blurRadius: 3,
                                  ),
                                ],
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
