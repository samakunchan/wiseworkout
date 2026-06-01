import 'package:intl/intl.dart';
import 'package:wiseworkout/features/database/models/workout_history_model.dart';

extension ListWorkoutHistoryExtension on List<WorkoutHistoryModel> {
  List<WorkoutHistoryModel> filteredByCurrentDay() {
    final DateTime now = DateTime.now().toLocal();

    return where(
      (WorkoutHistoryModel history) {
        final DateTime historyDate = history.date.toLocal();

        return historyDate.year == now.year && historyDate.month == now.month && historyDate.day == now.day;
      },
    ).toList();
  }

  List<WorkoutHistoryModel> filteredByOtherDays() {
    final DateTime now = DateTime.now().toLocal();

    return where(
      (WorkoutHistoryModel history) {
        final DateTime historyDate = history.date.toLocal();

        return historyDate.year != now.year || historyDate.month != now.month || historyDate.day != now.day;
      },
    ).toList();
  }

  List<WorkoutHistoryModel> filteredByCurrentMonth() {
    if (isEmpty) return [];
    final DateTime now = DateTime.now().toLocal();
    final int currentYear = now.year;
    final int currentMonth = now.month;

    return where(
      (WorkoutHistoryModel history) {
        final DateTime historyDate = history.date.toLocal();

        return historyDate.year == currentYear && historyDate.month == currentMonth;
      },
    ).toList();
  }

  Map<String, int> countSessionsPerDayInCurrentWeek() {
    final Map<String, int> sessionCounts = {};
    final DateTime now = DateTime.now().toLocal();
    final int daysToSubtract = now.weekday - 1;
    final DateTime startOfWeek = DateTime(now.year, now.month, now.day).subtract(Duration(days: daysToSubtract));
    final DateTime endOfWeek = startOfWeek.add(const Duration(days: 7)).subtract(const Duration(seconds: 1));

    // On donne 0 du lundi au dimanche...
    for (int i = 0; i < 7; i++) {
      sessionCounts[i.toString()] = 0;
    }

    for (final history in this) {
      final DateTime sessionDate = history.date.toLocal();

      final bool isInCurrentWeek =
          (sessionDate.isAtSameMomentAs(startOfWeek) || sessionDate.isAfter(startOfWeek)) && sessionDate.isBefore(endOfWeek);

      if (isInCurrentWeek) {
        // ...et on met à jour chaque jour avec la nouvelle session.
        sessionCounts.update((sessionDate.weekday - 1).toString(), (value) => value + 1);
      }
    }

    return sessionCounts;
  }

  Map<String, int> countSessionsPerDayInCurrentMonth() {
    final Map<String, int> sessionCounts = {};
    final DateTime now = DateTime.now().toLocal();
    final DateFormat dayNumberFormatter = DateFormat.d();
    final DateTime startOfMonth = DateTime(now.year, now.month);
    final DateTime endOfMonthExclusive = DateTime(now.year, now.month + 1);
    DateTime currentDate = startOfMonth;

    while (currentDate.isBefore(endOfMonthExclusive)) {
      final String dayKey = dayNumberFormatter.format(currentDate);
      sessionCounts[dayKey] = 0;
      currentDate = currentDate.add(const Duration(days: 1));
    }

    for (final WorkoutHistoryModel history in this) {
      final DateTime sessionDate = history.date.toLocal();

      final bool isInCurrentMonth =
          (sessionDate.isAtSameMomentAs(startOfMonth) || sessionDate.isAfter(startOfMonth)) &&
          sessionDate.isBefore(endOfMonthExclusive);

      if (isInCurrentMonth) {
        final String dayKey = dayNumberFormatter.format(sessionDate);

        sessionCounts.update(dayKey, (value) => value + 1);
      }
    }

    return sessionCounts;
  }

  int findLongestStreakInCurrentMonth() {
    if (isEmpty) return 0;

    final DateTime now = DateTime.now().toLocal();
    final int currentYear = now.year;
    final int currentMonth = now.month;

    final List<DateTime> uniqueDaysInMonth =
        map((WorkoutHistoryModel h) => h.date.toLocal())
            .where((date) => date.year == currentYear && date.month == currentMonth)
            .map((date) => DateTime(date.year, date.month, date.day)) // Remise à minuit pour une comparaison exacte
            .toSet() // Élimine les doublons (plusieurs sessions le même jour)
            .toList()
          ..sort(); // Tri croissant chronologique

    if (uniqueDaysInMonth.isEmpty) {
      return 0;
    }

    // 2. Parcourir les jours triés pour trouver la plus longue série
    int maxStreak = 1; // Au moins 1 si la liste n'est pas vide
    int currentStreak = 1;

    for (int i = 1; i < uniqueDaysInMonth.length; i++) {
      final DateTime currentDay = uniqueDaysInMonth[i];
      final DateTime previousDay = uniqueDaysInMonth[i - 1];

      // Calculer la différence en jours entre le jour actuel et le jour précédent
      final Duration difference = currentDay.difference(previousDay);

      // Si la différence est EXACTEMENT 1 jour, la série continue.
      if (difference.inDays == 1) {
        currentStreak++;
      } else {
        // Série brisée. Enregistrer le record si la série actuelle est meilleure.
        if (currentStreak > maxStreak) {
          maxStreak = currentStreak;
        }
        // Réinitialiser la série actuelle à 1 (pour le jour 'currentDay')
        currentStreak = 1;
      }
    }

    // 3. Vérifier la dernière série (elle pourrait être la plus longue)
    if (currentStreak > maxStreak) {
      maxStreak = currentStreak;
    }

    return maxStreak;
  }

  double averageSession() {
    final int denumerator = length;
    final int numerator = map((WorkoutHistoryModel h) => h.timerCompleted).fold(0, (int a, int b) => a + b);
    final double total = numerator / denumerator;

    return total.isNaN ? 0 : total;
  }

  String calculateAverageSessionTime() {
    if (isEmpty) return '0 secondes';
    final int totalDurationInSeconds = fold<int>(0, (int sum, WorkoutHistoryModel history) => sum + history.timerCompleted);
    final double averageInSeconds = totalDurationInSeconds / length;

    if (!averageInSeconds.isNaN && averageInSeconds.isFinite) {
      final int avgTotalSeconds = averageInSeconds.round();

      final int hours = avgTotalSeconds ~/ 3600;
      final int minutes = (avgTotalSeconds % 3600) ~/ 60;
      final int seconds = avgTotalSeconds % 60;

      final List<String> parts = [];

      if (hours > 0) {
        // Ex: "1h 5 min"
        parts.add('${hours}h');
        // Les minutes sont incluses si les heures sont présentes (selon votre exemple "1h 5 min")
        if (minutes > 0) {
          parts.add('$minutes min');
        }
        // Note: On arrêt souvent au niveau des minutes si l'heure est présente pour la concision.
      } else if (minutes > 0) {
        // Ex: "5 min 20 secondes"
        parts.add('$minutes min');
        if (seconds > 0) {
          parts.add('$seconds secondes');
        }
      } else {
        // Ex: "20 secondes" (uniquement si heures et minutes sont 0)
        parts.add('$seconds secondes');
      }
      return parts.join(' ');
    }

    return 'Erreur de calcul';
  }
}
