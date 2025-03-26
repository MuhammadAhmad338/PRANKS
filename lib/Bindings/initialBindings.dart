import 'package:get/get.dart';
import '../Controller/flashController.dart';
import '../Controller/switchController.dart';
import 'package:pranks/Controller/audioController.dart';
import 'package:pranks/Controller/subscriptionController.dart';

class Initialbindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioController(), fenix: true);
    Get.lazyPut(() => SwitchViewModel(), fenix: true);
    Get.lazyPut(() => FlashlightController(), fenix: true);
    Get.lazyPut(() => SubscriptionController(), fenix: true);
  }
}