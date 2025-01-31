import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/const.dart';
import '../../Details/View/details.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Widgets/customAppBar.dart';
import 'package:pranks/Model/CarousalDataModel.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      audioUrls: CConst.burpAudioUrls,
      images: CConst.burpimages,
      gradient: CColors.purpleGradient,
    ),
    CarouselItemModel(
      label: 'Gun Sound',
      image: 'assets/images/machinegun1.png',
      audioUrls: CConst.machinegunsounds,
      images: CConst.machinegunimages,
      gradient: CColors.yellowGradient,
    ),
    CarouselItemModel(
      label: 'DoorBell Sound',
      image: 'assets/images/bell11.png',
      audioUrls: CConst.doorbellAudioUrls,
      images: CConst.doorbellimages,
      gradient: CColors.pinkGradient,
    ),
    CarouselItemModel(
      label: 'Fart Sound',
      image: 'assets/images/fart1.png',
      audioUrls: CConst.fartAudioUrls,
      images: CConst.fartimages,
      gradient: CColors.greenGradient,
    ),
    CarouselItemModel(
      label: 'Tazer Sound',
      image: 'assets/images/tazer3.png',
      audioUrls: CConst.tazersounds,
      images: CConst.tazerimages,
      gradient: CColors.yellowGradient,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "PRANKS",),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
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
                    return GestureDetector(
                      onTap: () => Get.to(() => DetailsScreen(item: i, images: i.images, audioUrls: i.audioUrls,)),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: i.gradient,
                            ),
                            border: Border.all(color: CColors.blackColor, width: 2),
                          ),
                          child: Center(
                              child: Image.asset(
                            i.image,
                            fit: BoxFit.cover,
                            height: 300,
                          ))),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}
