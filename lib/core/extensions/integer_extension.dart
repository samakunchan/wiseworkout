extension DoubleExtension on double {
  int step({required double max, required int step}) {
    return ((max - this) / step).toInt();
  }
}

extension IntegerExtension on int {
  String formateTime() {
    final int minutes = this ~/ 60;
    final int remainingSeconds = this % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String formateTimeExtended() {
    final int hours = this ~/ 3600;
    final int minutes = (this % 3600) ~/ 60;
    final int remainingSeconds = this % 60;

    final String minutesPart = minutes.toString().padLeft(2, '0');
    final String secondsPart = remainingSeconds.toString().padLeft(2, '0');

    String formattedTime = '';

    if (hours > 0) {
      final String hoursPart = hours.toString().padLeft(2, '0');
      formattedTime = '$hoursPart:$minutesPart:$secondsPart';
    } else {
      // Cas sans heures : "MM:SSs"
      formattedTime = '$minutesPart:$secondsPart';
    }

    // Ajout du suffixe 's' requis
    return '${formattedTime}s';
  }

  int step({required int min, required int step}) {
    return (this - min) ~/ step;
  }
}
