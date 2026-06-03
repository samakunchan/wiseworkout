import 'package:flutter/material.dart';
import 'package:wiseworkout/features/feedback/widgets/feedback_button.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    required this.child,
    required this.title,
    required this.feedbackLabels,
    super.key,
  });

  final Widget child;
  final String title;
  final List<String> feedbackLabels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        surfaceTintColor: Colors.transparent,
        actions: [
          FeedbackButton(labels: feedbackLabels),
        ],
      ),
      body: child,
    );
  }
}
