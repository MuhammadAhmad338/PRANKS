import 'dart:ui';

class CarouselItemModel {
    final String label;
    final String image;
    final List<String> audioUrls;
    final List<String> images;
    final List<Color> gradient; // Add gradient property

    CarouselItemModel({
      required this.label,
      required this.image,
      required this.audioUrls,
      required this.images,
      required this.gradient,
    });

    factory CarouselItemModel.fromMap(Map<String, dynamic> map) {
      return CarouselItemModel(
        label: map['label'] ?? '',
        image: map['image'] ?? '',
        audioUrls: List<String>.from(map['audioUrls'] ?? []),
        images: List<String>.from(map['images'] ?? []),
        gradient: List<Color>.from(map['gradient']?.map((x) => Color(x)) ?? []),
      );
    }

    Map<String, dynamic> toMap() {
      return {
        'label': label,
        'image': image,
        'audioUrls': audioUrls,
        'images': images,
        'gradient': gradient.map((x) => x.value).toList(),
      };
    }
}