import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pranks/Widgets/customAppBar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Controller/flashController.dart';
import '../../../Controller/switchController.dart';
import 'package:pranks/Widgets/switchListTile.dart';
import 'package:pranks/View/Subscription/View/subscription.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final SwitchViewModel switchViewModel = Get.find<SwitchViewModel>();
    final FlashlightController flashlightController =
        Get.find<FlashlightController>();

    return Scaffold(
      appBar: const CustomAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                color: CColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CColors.blackColor, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SwitchListTileWidget(
                      title: 'FLASH',
                      value: flashlightController.isSwitchEnabled,
                      onChanged: (bool value) {
                        flashlightController.setSwitchEnabled(value);
                      },
                    ),
                    SwitchListTileWidget(
                      title: 'VIBRATE',
                      value: switchViewModel.vibrateSoundSwitch,
                      onChanged: (bool value) {
                        switchViewModel.enableVibration(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: CColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CColors.blackColor, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 7),
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "Subscription",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () => Get.to(() => const SubscriptionPage()),
                    ),
                    ListTile(
                      title: const Text(
                        "Rate Us",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () async {
                        final Uri url = Uri.parse(
                            "https://play.google.com/store/apps/details?id=com.yourprankname.pranks");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // fallback message
                          Get.snackbar(
                            "Error",
                            "Could not open the store link.",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Privacy Policy",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () async {
                        final Uri url = Uri.parse(
                            'https://sites.google.com/view/pranks-privacy-policy/home');

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Share Apps",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        Share.share(
                            'Check out this amazing app: https://play.google.com/store/apps/details?id=com.yourprankname.pranks');
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
