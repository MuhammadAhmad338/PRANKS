import 'package:flutter/material.dart';
import 'package:pranks/Model/CarousalDataModel.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Widgets/customAppBar.dart';

class DetailsScreen extends StatelessWidget {
  final CarouselItemModel item;
  final List<String> audioUrls;
  final List<String> images;

  const DetailsScreen({
    super.key,
    required this.item,
    required this.audioUrls,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: item.label),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: CColors.blackColor.withOpacity(0.2),
                  offset: const Offset(0, 7),
                  blurRadius: 10,
                  spreadRadius: 0
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: item.gradient,
              ),
            ),
            child: Image.asset(
              item.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: item.audioUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: CColors.blackColor,
                        width: 2,
                      ),
                      boxShadow:  [
                        BoxShadow(
                          color: CColors.blackColor.withOpacity(0.4),
                          offset:  const Offset(0, 7),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: item.gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        item.images[index],
                        scale: 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
