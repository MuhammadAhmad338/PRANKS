import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Model/CarousalDataModel.dart';
import 'package:pranks/Utils/const.dart';
import 'package:pranks/View/PrankSounds/View/prankSounds.dart';

class PrankScreen extends StatelessWidget {
  final CarouselItemModel item;

  const PrankScreen({super.key, required this.item});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            item.label,
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
            )
          ),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(backUrl, height: 30, width: 30,),
            )),
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                  colors: CColors.yellowGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
          )))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemCount: item.images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //  Get.to(() => PrankScrseen(item: carouselData[index]));
                Get.to(() => PrankScreenView(
                      label: item.label,
                      audio: item.audioUrls[index],
                      images: item.images,
                      audios: item.audioUrls,
                      initialIndex: index,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: item.gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: item.gradient.reversed.toList(),
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        item.images[index],
                        
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
