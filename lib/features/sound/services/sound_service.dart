import 'package:audioplayers/audioplayers.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';

class SoundService {
  Future<void> playSound(String sound) async {
    await kGetIt<AudioPlayer>().play(AssetSource('audio/$sound'));
  }
}
