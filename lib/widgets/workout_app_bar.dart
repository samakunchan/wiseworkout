import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/feedback/signals/feed_back_store.dart';
import 'package:wiseworkout/features/feedback/widgets/feedback_button.dart';

class WorkoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WorkoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedBackStore feedbackStore = kGetIt<FeedBackStore>();

    return AppBar(
      title: Image.asset(kAssetLogo, height: 56, fit: .contain),
      surfaceTintColor: Colors.transparent,
      actions: [
        SignalBuilder(
          builder: (BuildContext context) {
            final List<String> labels = feedbackStore.mainScreenLabels.value;
            return FeedbackButton(labels: labels);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(20, 70);
}
