import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:wiseworkout/features/feedback/services/feedback_service.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key, this.labels = const []});
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.bug_report),
      onPressed: () {
        BetterFeedback.of(context).show((UserFeedback feedback) => FeedbackService.submitFeedback(context, feedback, labels));
      },
    );
  }
}
