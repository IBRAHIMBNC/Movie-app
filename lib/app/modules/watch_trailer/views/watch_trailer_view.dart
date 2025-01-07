import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/watch_trailer_controller.dart';

class WatchTrailerView extends GetView<WatchTrailerController> {
  const WatchTrailerView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value
        ? const CircularProgressIndicator.adaptive()
        : YoutubePlayerBuilder(
            player: YoutubePlayer(
              width: 1.sw,
              controller: controller.youtubePlayerController!,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                playedColor: AppColors.skyBlueColor,
                handleColor: AppColors.skyBlueColor,
              ),
              onEnded: (metaData) {
                controller.onExit();
              },
              topActions: [
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    controller.onExit();
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
            builder: (context, player) {
              return player;
            },
          );
  }
}
