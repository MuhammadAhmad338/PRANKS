import 'package:get/get.dart';
import 'package:pranks/Controller/audioController.dart';

class Initialbindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AudioController());
  }
}