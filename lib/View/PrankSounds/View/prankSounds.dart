import 'package:get/get.dart';
import 'package:pranks/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Controller/audioController.dart';
import 'package:pranks/Controller/flashController.dart';
import 'package:pranks/Controller/switchController.dart';
import 'package:pranks/View/Settings/View/Settings.dart';
import 'package:pranks/Widgets/prankContainer.dart';

class PrankScreenView extends StatefulWidget {
  final List<String> audios;
  final String label;
  final String audio;
  final List<String> images;
  final int initialIndex;

  const PrankScreenView({
    super.key,
    required this.label,
    required this.audio,
    required this.images,
    required this.audios,
    required this.initialIndex,
  });

  @override
  State<PrankScreenView> createState() => _PrankScreenViewState();
}

class _PrankScreenViewState extends State<PrankScreenView>
    with SingleTickerProviderStateMixin {
  final double listViewHeight = 100.0;
  int? selectedIndex;
  late String currentImage;
  bool isLooping = false;

  final audioController = Get.find<AudioController>();
  final flashlightController = Get.find<FlashlightController>();
  final switchViewController = Get.find<SwitchViewModel>();

  final List<List<Color>> gradientColors = [
    CColors.yellowGradient,
    CColors.purpleGradient,
    CColors.greenGradient,
    CColors.pinkGradient,
    CColors.yellowGradient,
    CColors.purpleGradient,
    CColors.greenGradient,
    CColors.pinkGradient
  ];

  List<Color> get currentGradient =>
      gradientColors[selectedIndex ?? 0 % gradientColors.length];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
    currentImage = widget.images[widget.initialIndex];
    audioController.setLooping(false);
  }

  void playSelectedAudio() {
    String audioToPlay =
        selectedIndex != null ? widget.audios[selectedIndex!] : widget.audio;

    audioController.stopAudio();
    audioController.setLooping(isLooping);
    audioController.playAudio(audioToPlay);

    if (!isLooping) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!isLooping && mounted) {
          audioController.stopAudio();
        }
      });
    }

    if (flashlightController.isSwitchEnabled.value) {
      flashlightController.startTorchFlicker();
      if (!isLooping) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            flashlightController.stopTorchFlicker();
          }
        });
      }
    }

    if (switchViewController.vibrateSoundSwitch.value) {
      switchViewController.enableVibration(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36),
                ),
                gradient: LinearGradient(
                  colors: currentGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              audioController.stopAudio();
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(backUrl, scale: 1.5),
                            )),
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.label,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CColors.whiteColor,
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
                                letterSpacing: 2,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => Get.to(() => const SettingsScreen()),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Image.asset(settingsUrl, scale: 1.4),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(80),
                    child: GestureDetector(
                      onTap: playSelectedAudio,
                      onLongPress: () {
                        String audioToPlay = selectedIndex != null
                            ? widget.audios[selectedIndex!]
                            : widget.audio;

                        audioController.setLooping(isLooping);
                        audioController.playAudio(audioToPlay);

                        if (flashlightController.isSwitchEnabled.value) {
                          flashlightController.startTorchFlicker();
                        }
                        if (switchViewController.vibrateSoundSwitch.value) {
                          switchViewController.enableVibration(true);
                        }
                      },
                      onLongPressUp: () {
                        if (!isLooping) {
                          audioController.stopAudio();
                          flashlightController.stopTorchFlicker();
                          if (switchViewController.vibrateSoundSwitch.value) {
                            switchViewController.enableVibration(true);
                          }
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Image.asset(
                            currentImage,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text(
                          "LOOP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Switch(
                          value: isLooping,
                          onChanged: (value) {
                            setState(() {
                              isLooping = value;
                              if (!value) {
                                audioController.stopAudio();
                                flashlightController.stopTorchFlicker();
                              }
                              audioController.setLooping(value);
                            });
                          },
                          activeColor: CColors.yellowColor,
                          activeTrackColor: CColors.greenColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: SizedBox(
              height: listViewHeight,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.audios.length,
                itemBuilder: (context, index) {
                  final colors = gradientColors[index % gradientColors.length];
                  final image = widget.images[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4.3),
                    child: PrankContainerWidget(
                      label: "Prank ${index + 1}",
                      isSelected: selectedIndex == index,
                      colors: colors,
                      image: image,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          currentImage = widget.images[index];
                        });
                        audioController.stopAudio();
                        flashlightController.stopTorchFlicker();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioController.stopAudio();
    flashlightController.stopTorchFlicker();
    super.dispose();
  }
}
