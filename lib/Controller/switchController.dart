import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class SwitchViewModel extends GetxController {
// Use RxBool for reactivity
  RxBool clickSoundSwitch = false.obs;
  RxBool vibrateSoundSwitch = false.obs;

// Method to toggle the clickSoundSwitch
  void toggleSwitch(bool value) {
    clickSoundSwitch.value = value;
  }

// Method to toggle the vibrateSoundSwitch
  void vibrateSwitch(bool value) {
    vibrateSoundSwitch.value = value;
  }

  void enableFlutterBeep(bool isBeepEnabled) {
    clickSoundSwitch.value = isBeepEnabled;
    if (isBeepEnabled) {
      //   FlutterBeep.beep();
    } else {
      print("Nothing is beeped!");
    }
  }

  void enableVibration(bool isVibratorEnabled) async {
    vibrateSoundSwitch.value = isVibratorEnabled;
    if (isVibratorEnabled) {
      Vibration.vibrate();
    }
  }
}