// ignore_for_file: deprecated_member_use
import 'package:pranks/Utils/ccolors.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/const.dart';

class PrankContainerWidget extends StatelessWidget {
  final String label;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;
  final List<Color> colors;

  const PrankContainerWidget(
      {super.key,
      required this.label,
      required this.image,
      required this.isSelected,
      required this.onTap,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: isSelected
                ? 100 // Increased width
                : 100, // Increased width
            height: isSelected
                ? 100 // Increased height
                : 100, // Increased height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: colors),
              border: Border.all(
                color: isSelected
                    ? CColors.blackColor.withOpacity(0.4)
                    : Colors.transparent,
                width: isSelected ? 5 : 0,
              ),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: isSelected
                    ? 100 // Adjusted height
                    : 100, // Adjusted height
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            child: Image.asset(
              glare, // Replace with your image path
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
