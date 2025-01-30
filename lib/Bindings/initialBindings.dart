import 'package:get/get.dart';
import '../Controller/flashController.dart';
import '../Controller/switchController.dart';
import 'package:pranks/Controller/audioController.dart';

class Initialbindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AudioController());
    Get.lazyPut(() => SwitchViewModel());
    Get.lazyPut(() => FlashlightController());
  }
}