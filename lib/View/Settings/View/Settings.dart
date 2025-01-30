import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:share_plus/share_plus.dart';
import '../../../Controller/flashController.dart';
import '../../../Controller/switchController.dart';
import 'package:pranks/Widgets/switchListTile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final FlashlightController _flashlightController =
        Get.find<FlashlightController>();
    final SwitchViewModel _switchViewModel = Get.find<SwitchViewModel>();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor:
            Colors.transparent, // Make AppBar transparent to show gradient
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: CColors.yellowGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: CColors.whiteColor,
            fontWeight: FontWeight.w900,
            fontSize: 28,
            letterSpacing: 2,
            shadows: [
              Shadow(
                color: CColors.purpleAccentColor,
                offset: Offset(3, 3),
                blurRadius: 0,
              ),
              Shadow(
                color: CColors.purpleAccentColor,
                offset: Offset(-2, -2),
                blurRadius: 0,
              ),
              Shadow(
                color: CColors.purpleAccentColor,
                offset: Offset(2, -2),
                blurRadius: 0,
              ),
              Shadow(
                color: CColors.purpleAccentColor,
                offset: Offset(-2, 2),
                blurRadius: 0,
              ),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            // if (_switchViewModel.clickSoundSwitch.value == true) {
            //   //           final audioController = Get.find<AudioController>();
            //   //   audioController.playBeep();
            //   Get.back();
            // }
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(
              'assets/images/back.png',
              scale: 1.4,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: CColors.blackColor, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 7),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Card(
                elevation: 0, // Remove default card elevation
                margin: EdgeInsets.zero, // Remove default card margin
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SwitchListTileWidget(
                      title: 'FLASH',
                      value: _flashlightController.isSwitchEnabled,
                      onChanged: (bool value) {
                        _flashlightController.setSwitchEnabled(value);
                      },
                    ),
                    SwitchListTileWidget(
                      title: 'VIBRATE',
                      value: _switchViewModel.vibrateSoundSwitch,
                      onChanged: (bool value) {
                        _switchViewModel.enableVibration(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3), // Spacing between cards
            // Second Card
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: CColors.blackColor, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 7),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Card(
                elevation: 0, // Remove default card elevation
                margin: EdgeInsets.zero, // Remove default card margin
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "Subscription",
                        style: TextStyle(fontSize: 25),
                      ),
                      onTap: () {
                        //   Get.to(() => SubscriptionScreen());
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Rate Us",
                        style: TextStyle(fontSize: 25),
                      ),
                      onTap: () {
                        Get.snackbar(
                          "Notice",
                          "Rate us feature will be available soon",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: CColors.yellowColor,
                          colorText: Colors.black,
                          duration: const Duration(seconds: 2),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Privacy Policy",
                        style: TextStyle(fontSize: 25),
                      ),
                      onTap: () {
                        // Get.to(() => const PrivacyPolicyScreen());
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Share Apps",
                        style: TextStyle(fontSize: 25),
                      ),
                      onTap: () {
                        Share.share(
                            'Check out this amazing app: https://play.google.com/store/apps/details?id=com.example.yourapp');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
