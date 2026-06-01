import 'package:audioplayers/audioplayers.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/sound/signals/workout_settings_store.dart';

class SoundService {
  Future<void> playSound(String sound) async {
    if (kGetIt<WorkoutSettingsStore>().timerConf.value.soundSelected) {
      await kGetIt<AudioPlayer>().play(AssetSource('audio/$sound'));
    }
  }
}
