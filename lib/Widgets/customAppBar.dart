// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:pranks/Utils/ccolors.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   const CustomAppBar({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     // final SwitchViewModel switchViewModel = Get.find<SwitchViewModel>();
//     return AppBar(
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: CColors.yellowGradient,
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//       ),
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 10.0), // Add left padding
//         child: Image.asset(
//           appBarCloud, // Replace with your cloud image path
//           scale: 2,
//         ),
//       ),
//       leadingWidth:
//           72, // Adjust this value to fine-tune the left image position
//       title: Text(
//         title,
//         style:  TextStyle(
//           color: CColors.whiteColor,
//           fontWeight: FontWeight.w900,
//           fontSize: 28,
//           letterSpacing: 2,
//           shadows: [
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: const Offset(3, 3),
//               blurRadius: 0,
//             ),
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: const Offset(-2, -2),
//               blurRadius: 0,
//             ),
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: Offset(2, -2),
//               blurRadius: 0,
//             ),
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: const Offset(-2, 2),
//               blurRadius: 0,
//             ),
//           ],
//         ),
//       ),
//       centerTitle: true,
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 16.0), // Add right padding
//           child: GestureDetector(
//             onTap: () {
//               if (switchViewModel.clickSoundSwitch.value == true) {
//                 final audioController = Get.find<AudioController>();
//                 audioController.playBeep();
//               }
//               Get.to(() => const SettingsScreen());
//             },
//             child: Image.asset(
//               settingsUrl, // Replace with your settings image path
//               scale: 1.4,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// class CustomSettingsAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   final String title;

//   const CustomSettingsAppBar({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     SwitchViewModel switchViewModel = Get.find<SwitchViewModel>();
//     return AppBar(
//       backgroundColor:
//           Colors.transparent, // Make AppBar transparent to show gradient
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: CColors.yellowGradient,
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//       ),
//       leading: GestureDetector(
//         onTap: () {
//           if (switchViewModel.clickSoundSwitch.value == true) {
//             // final audioController = Get.find<AudioController>();
//             // audioController.playBeep();
//           }
//           Get.back();
//         },
//         child: Image.asset(
//           backUrl, // Replace with your cloud image path
//           scale: 1.4,
//         ),
//       ),
//       leadingWidth:
//           72, // Adjust this value to fine-tune the left image position
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w900,
//           fontSize: 28,
//           letterSpacing: 2,
//           shadows: [
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: Offset(3, 3),
//               blurRadius: 0,
//             ),
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: Offset(-2, -2),
//               blurRadius: 0,
//             ),
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: Offset(2, -2),
//               blurRadius: 0,
//             ),
//             Shadow(
//               color: CColors.purpleAccentColor,
//               offset: Offset(-2, 2),
//               blurRadius: 0,
//             ),
//           ],
//         ),
//       ),
//       centerTitle: true,
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 16.0), // Add right padding
//           child: GestureDetector(
//             onTap: () {
//               if (switchViewModel.clickSoundSwitch.value == true) {
//                 //      audioController.playBeep();
//               }
//               // Get.to(() => const SettingsScreen());
//             },
//             child: Image.asset(
//               settingsUrl, // Replace with your settings image path
//               scale: 1.4,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
