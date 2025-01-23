class CarouselItemModel {
    final String label;
    final String image;
    final List<String> audioUrls;
    final List<String> images;

    CarouselItemModel({
      required this.label,
      required this.image,
      required this.audioUrls,
      required this.images,
    });

    factory CarouselItemModel.fromMap(Map<String, dynamic> map) {
      return CarouselItemModel(
        label: map['label'] ?? '',
        image: map['image'] ?? '',
        audioUrls: List<String>.from(map['audioUrls'] ?? []),
        images: List<String>.from(map['images'] ?? []),
      );
    }

    Map<String, dynamic> toMap() {
      return {
        'label': label,
        'image': image,
        'audioUrls': audioUrls,
        'images': images,
      };
    }
  }