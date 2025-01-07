import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerController extends GetxController {
  final String videoId = Get.arguments as String;
  final RxBool isLoading = false.obs;
  YoutubePlayerController? youtubePlayerController;

  void init() async {
    isLoading.value = true;
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  @override
  void onInit() {
    init();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    isLoading.value = false;
    super.onInit();
  }

  void onExit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Get.back();
  }

  @override
  void onClose() {
    youtubePlayerController?.dispose();
    super.onClose();
  }
}
