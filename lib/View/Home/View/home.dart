import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/const.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Model/CarousalDataModel.dart';
import 'package:pranks/View/Prank/View/prankView.dart';
import 'package:pranks/View/Settings/View/Settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CarouselItemModel> carouselData = [
    CarouselItemModel(
      label: 'Burp Sound',
      image: 'assets/images/burp1.png',
      audioUrls: burpAudioUrls,
      images: burpimages,
      gradient: CColors.purpleGradient,
    ),
    CarouselItemModel(
      label: 'Gun Sound',
      image: 'assets/images/machinegun1.png',
      audioUrls: machinegunsounds,
      images: machinegunimages,
      gradient: CColors.yellowGradient,
    ),
    CarouselItemModel(
      label: 'DoorBell Sound',
      image: 'assets/images/bell11.png',
      audioUrls: doorbellAudioUrls,
      images: doorbellimages,
      gradient: CColors.pinkGradient,
    ),
    CarouselItemModel(
      label: 'Fart Sound',
      image: 'assets/images/fart1.png',
      audioUrls: fartAudioUrls,
      images: fartimages,
      gradient: CColors.greenGradient,
    ),
    CarouselItemModel(
      label: 'Truck Sound',
      image: 'assets/images/truck4.png',
      audioUrls: trucksounds,
      images: truckimages,
      gradient: CColors.yellowGradient,
    ),
    CarouselItemModel(
      label: 'Horn Sound',
      image: 'assets/images/horn6.png',
      audioUrls: hornsounds,
      images: hornimages,
      gradient: CColors.pinkGradient,
    ),
    CarouselItemModel(
      label: 'Hair Dryer',
      image: 'assets/images/hairdryer1.png',
      audioUrls: hairdryersounds,
      images: hairdryerimages,
      gradient: CColors.purpleGradient,
    ),
    CarouselItemModel(
      label: 'Scissors Sound',
      image: 'assets/images/scissors1.png',
      audioUrls: scissorssounds,
      images: scissorimages,
      gradient: CColors.greenGradient,
    ),
    CarouselItemModel(
      label: 'Glass Sound',
      image: 'assets/images/glass1.png',
      audioUrls: glasssounds,
      images: glassimages,
      gradient: CColors.yellowGradient,
    ),
    CarouselItemModel(
      label: 'Piano Sound',
      image: 'assets/images/piano1.png',
      audioUrls: pianosounds,
      images: pianoimages,
      gradient: CColors.pinkGradient,
    ),
  ];

  // Helper method to determine if an icon needs special sizing
  double getIconScale(String label) {
    // Increase size for specific icons
    if (label == 'Burp Sound' ||
        label == 'DoorBell Sound' ||
        label == 'Fart Sound') {
      return 1.8; // 40% larger than standard
    }
    return 0.9; // Standard size for other icons
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: CColors.yellowGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        centerTitle: true,
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
        title: const Text("Pranks",
            style: TextStyle(
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
            )),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: carouselData.length,
        itemBuilder: (context, index) {
          // Get the scaling factor for this particular icon
          final scale = getIconScale(carouselData[index].label);

          return GestureDetector(
            onTap: () => Get.to(() => PrankScreen(item: carouselData[index])),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: carouselData[index].gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: carouselData[index].gradient.reversed.toList(),
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Transform.scale(
                        scale: scale,
                        child: Image.asset(
                          carouselData[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
