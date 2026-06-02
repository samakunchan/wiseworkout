import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';

class SoundService {
  Future<void> playSound(String sound) async {
    final AudioPlayer player = kGetIt<AudioPlayer>();
    if (kIsWeb) {
      await player.audioCache.clearAll();
    }
    await player.play(AssetSource('audio/$sound'));
  }
}
