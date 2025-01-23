import 'package:flutter/material.dart';
import 'package:pranks/Model/CarousalDataModel.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pranks/Utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CarouselItemModel> carouselData = [
    CarouselItemModel(
      label: 'Gun Sound',
      image: 'assets/images/machinegun1.png',
      audioUrls: CConst.machinegunsounds,
      images: CConst.machinegunimages,
    ),
    CarouselItemModel(
      label: 'Burp Sound',
      image: 'assets/images/bell11.png',
      audioUrls: CConst.burpAudioUrls,
      images: CConst.burpimages,
    ),
    CarouselItemModel(
      label: 'DoorBell Sound',
      image: 'assets/images/burp1.png',
      audioUrls: CConst.doorbellAudioUrls,
      images: CConst.doorbellimages,
    ),
    CarouselItemModel(
      label: 'Fart Sound',
      image: 'assets/images/fart1.png',
      audioUrls: CConst.fartAudioUrls,
      images: CConst.fartimages,
    ),
    CarouselItemModel(
      label: 'Tazer Sound',
      image: 'assets/images/fart1.png',
      audioUrls: CConst.tazersounds,
      images: CConst.tazerimages,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
        body: Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 500,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          items: carouselData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [CColors.yellowColor, CColors.blackColor],
                      ),
                      border: Border.all(color: CColors.blackColor, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(child: Image.asset(i.image, fit: BoxFit.cover, height: 300,)));
              },
            );
          }).toList(),
        ),
      ],
    ));
  }
}
