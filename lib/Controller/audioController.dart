import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerComplete.listen((event) {
      isPlaying.value = false;
    });
  }

  Future<void> playAudio(String audioPath) async {
    try {
      await audioPlayer.play(AssetSource(audioPath));
      isPlaying.value = true;
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      print("Error stopping audio: $e");
    }
  }

  Future<void> playBeep() async {
    try {
      await audioPlayer.play(AssetSource('sounds/beep/beep.wav'));
    } catch (e) {
      print('Error playing beep: $e');
    }
  }

  void setLooping(bool looping) {
    audioPlayer
        .setReleaseMode(looping ? ReleaseMode.loop : ReleaseMode.release);
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
