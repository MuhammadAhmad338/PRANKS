import 'package:get/get.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightController extends GetxController {
  bool _isFlickering = false;
  final RxBool _isSwitchEnabled = false.obs;
  bool get isFlickering => _isFlickering;
  RxBool get isSwitchEnabled => _isSwitchEnabled;

  //Toggle the flashlight from here
  Future<void> toggleFlashlight() async {
    if (_isSwitchEnabled.value) {
      if (_isFlickering) {
        await TorchLight.disableTorch();
        _isFlickering = false;
      } else {
        await TorchLight.enableTorch();
        _isFlickering = true;
        if (_isFlickering) {
          startFlicker();
        }
      }
    } else {
      await TorchLight.disableTorch();
      _isFlickering = false;
    }
  }

  //Start the flicker
  Future<void> startTorchFlicker() async {
    if (_isSwitchEnabled.value) {
      _isFlickering = true;
      startFlicker();
    }
  }

  // Stop the flicker
  Future<void> stopTorchFlicker() async {
    _isFlickering = false;
    await TorchLight.disableTorch(); // Ensure the torch is off when stopped
  }

  //Is switch is enabled
  void setSwitchEnabled(bool enabled) {
    _isSwitchEnabled.value = enabled;
    if (!enabled) {
      stopTorchFlicker(); // Ensure torch is off when switch is disabled
    } else if (_isFlickering) {
      startFlicker(); // Restart flicker if switch is enabled
    }
  }

  //Here u can start the flicker
  void startFlicker() async {
    while (_isFlickering) {
      await TorchLight.enableTorch();
      await Future.delayed(const Duration(milliseconds: 100));
      await TorchLight.disableTorch();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }
}
